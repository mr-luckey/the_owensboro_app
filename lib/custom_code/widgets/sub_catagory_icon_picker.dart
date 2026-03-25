// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_svg/svg.dart';

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class SubCatagoryIconPicker extends StatefulWidget {
  const SubCatagoryIconPicker({
    super.key,
    this.width,
    this.height,
    this.onUrlGenerated,
    this.initialImageUrl,
  });

  final double? width;
  final double? height;
  final Future Function(String? url)? onUrlGenerated;
  final String? initialImageUrl;

  @override
  State<SubCatagoryIconPicker> createState() => _SubCatagoryIconPickerState();
}

class _SubCatagoryIconPickerState extends State<SubCatagoryIconPicker> with GetxStatefulStateMixin {
  File? _selectedFile;
  String? _svgContent;
  bool _isUploading = false;
  String? _downloadUrl;
  bool _hasPickedNewImage = false;

  @override
  void initState() {
    super.initState();
    // Set initial download URL from widget parameter
    _downloadUrl = widget.initialImageUrl;
  }

  Future<void> _pickSvgFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['svg'],
      withData: true,
    );

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.single;

      if (kIsWeb) {
        if (file.bytes != null) {
          final svgData = String.fromCharCodes(file.bytes!);
          safeSetState(() {
            _svgContent = svgData;
            _hasPickedNewImage = true;
          });

          // Upload the file to Firebase Storage
          await _uploadSvgToFirebase(file.bytes!, file.name);
        }
      } else if (file.path != null) {
        final pickedFile = File(file.path!);
        final svgData = await pickedFile.readAsString();
        safeSetState(() {
          _selectedFile = pickedFile;
          _svgContent = svgData;
          _hasPickedNewImage = true;
        });

        // Upload to Firebase Storage
        await _uploadSvgToFirebase(await pickedFile.readAsBytes(), file.name);
      }
    }
  }

  Future<void> _uploadSvgToFirebase(
      Uint8List fileBytes, String fileName) async {
    safeSetState(() => _isUploading = true);

    try {
      // Create a reference to Firebase Storage
      final storageRef = FirebaseStorage.instance.ref().child('svgs/$fileName');

      // Upload the file (for both web & mobile)
      final uploadTask = await storageRef.putData(
        fileBytes,
        SettableMetadata(contentType: 'image/svg+xml'),
      );

      // Get the download URL
      final url = await uploadTask.ref.getDownloadURL();

      safeSetState(() {
        _downloadUrl = url;
        _isUploading = false;
      });

      // Call the callback with the URL
      await widget.onUrlGenerated?.call(url);

      print('✅ Uploaded successfully! Download URL: $url');
    } catch (e) {
      safeSetState(() => _isUploading = false);
      print('❌ Upload failed: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Upload failed: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickSvgFile,
      child: Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100,
        ),
        child: _isUploading
            ? const Center(child: CircularProgressIndicator())
            : _buildImageWidget(),
      ),
    );
  }

  Widget _buildImageWidget() {
    // If user picked a new image, show it from local content
    if (_hasPickedNewImage && _svgContent != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SvgPicture.string(
          _svgContent!,
          width: 180,
          height: 180,
          fit: BoxFit.contain,
          placeholderBuilder: (context) =>
              const Center(child: CircularProgressIndicator()),
        ),
      );
    }

    // If there's an initial/downloaded URL, show it from network
    if (_downloadUrl != null && _downloadUrl!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SvgPicture.network(
          _downloadUrl!,
          width: 180,
          height: 180,
          // color: Colors.red,
          fit: BoxFit.contain,
          placeholderBuilder: (context) =>
              const Center(child: CircularProgressIndicator()),
        ),
      );
    }

    // No image - show placeholder
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add_photo_alternate, size: 40, color: Colors.grey),
          SizedBox(height: 8),
          Text('Tap to pick SVG', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

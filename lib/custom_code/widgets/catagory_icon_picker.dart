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

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/svg.dart';

class CatagoryIconPicker extends StatefulWidget {
  const CatagoryIconPicker({
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
  State<CatagoryIconPicker> createState() => _CatagoryIconPickerState();
}

class _CatagoryIconPickerState extends State<CatagoryIconPicker> with GetxStatefulStateMixin {
  File? _selectedFile;
  String? _svgContent;
  bool _isUploading = false;
  String? _downloadUrl;
  Uint8List? _imageBytes;
  String? _fileExtension;

  @override
  void initState() {
    super.initState();
    _downloadUrl = widget.initialImageUrl;
    if (_downloadUrl != null && _downloadUrl!.isNotEmpty) {
      // Determine extension from URL if possible
      final uri = Uri.tryParse(_downloadUrl!);
      if (uri != null && uri.path.contains('.')) {
        _fileExtension = uri.path.split('.').last.toLowerCase();
      }
    }
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['svg', 'png', 'jpg', 'jpeg', 'webp'],
      withData: true,
    );

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.single;
      final extension = file.extension?.toLowerCase();

      if (kIsWeb) {
        if (file.bytes != null) {
          safeSetState(() {
            _imageBytes = file.bytes;
            _fileExtension = extension;
            _svgContent =
                extension == 'svg' ? String.fromCharCodes(file.bytes!) : null;
            _downloadUrl = null; // New image picked, clear old URL
          });
          await _uploadToFirebase(file.bytes!, file.name);
        }
      } else if (file.path != null) {
        final pickedFile = File(file.path!);
        final bytes = await pickedFile.readAsBytes();
        safeSetState(() {
          _selectedFile = pickedFile;
          _imageBytes = bytes;
          _fileExtension = extension;
          _svgContent = extension == 'svg' ? String.fromCharCodes(bytes) : null;
          _downloadUrl = null; // New image picked, clear old URL
        });

        await _uploadToFirebase(bytes, file.name);
      }
    }
  }

  String _getContentType() {
    switch (_fileExtension) {
      case 'svg':
        return 'image/svg+xml';
      case 'png':
        return 'image/png';
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'webp':
        return 'image/webp';
      default:
        return 'application/octet-stream';
    }
  }

  Future<void> _uploadToFirebase(Uint8List fileBytes, String fileName) async {
    safeSetState(() => _isUploading = true);

    try {
      // Create a reference to Firebase Storage
      final storageRef = FirebaseStorage.instance.ref().child('svgs/$fileName');

      // Upload the file (for both web & mobile)
      final uploadTask = await storageRef.putData(
        fileBytes,
        SettableMetadata(contentType: _getContentType()),
      );

      // Get the download URL
      final url = await uploadTask.ref.getDownloadURL();

      safeSetState(() {
        // FFAppState().selectedImagePath = url;
        widget.onUrlGenerated?.call(url);

        _downloadUrl = url;
        _isUploading = false;
      });

      print('✅ Uploaded successfully! Download URL: $url');
    } catch (e) {
      safeSetState(() => _isUploading = false);
      print('❌ Upload failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload failed: $e')),
      );
    }
  }

  Widget _buildImageWidget() {
    // 1. Show local picked image (fastest feedback)
    if (_imageBytes != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: _fileExtension == 'svg' && _svgContent != null
            ? SvgPicture.string(
                _svgContent!,
                width: widget.width ?? 180,
                height: widget.height ?? 180,
                fit: BoxFit.contain,
              )
            : Image.memory(
                _imageBytes!,
                width: widget.width ?? 180,
                height: widget.height ?? 180,
                fit: BoxFit.cover,
              ),
      );
    }

    // 2. Show network image if available
    if (_downloadUrl != null && _downloadUrl!.isNotEmpty) {
      final isSvg = _downloadUrl!.toLowerCase().contains('.svg') ||
          _fileExtension == 'svg';
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: isSvg
            ? SvgPicture.network(
                _downloadUrl!,
                width: widget.width ?? 180,
                height: widget.height ?? 180,
                fit: BoxFit.contain,
                placeholderBuilder: (_) =>
                    const Center(child: CircularProgressIndicator()),
              )
            : Image.network(
                _downloadUrl!,
                width: widget.width ?? 180,
                height: widget.height ?? 180,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
      );
    }

    // 3. Show placeholder
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add_photo_alternate, size: 40, color: Colors.grey),
          const SizedBox(height: 8),
          const Text('Tap to pick Image', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickFile,
      child: Container(
        height: widget.height ?? 180,
        width: widget.width ?? 180,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildImageWidget(),
            if (_isUploading)
              Container(
                color: Colors.black26,
                child: const CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}

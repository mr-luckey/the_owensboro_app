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

class ImageWidget extends StatefulWidget {
  const ImageWidget({
    super.key,
    this.width,
    this.height,
    this.imageUrl,
  });

  final double? width;
  final double? height;
  final String? imageUrl;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Image.network(
        height: 50,
        width: 50,
        widget.imageUrl ??
            "https://localmedia.org/wp-content/uploads/2021/06/events-1.png",
        fit: BoxFit.fill,
      ),
    );
  }
}

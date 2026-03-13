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

class SvgNetworkImage extends StatefulWidget {
  const SvgNetworkImage({
    super.key,
    this.width,
    this.height,
    this.url,
  });

  final double? width;
  final double? height;
  final String? url;

  @override
  State<SvgNetworkImage> createState() => _SvgNetworkImageState();
}

class _SvgNetworkImageState extends State<SvgNetworkImage> {
  bool get _isSvg =>
      widget.url != null && widget.url!.toLowerCase().endsWith('.svg');
  @override
  Widget build(BuildContext context) {
    if (widget.url == null || widget.url!.isEmpty) {
      return const SizedBox();
    }
    if (_isSvg) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(40),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: widget.width ?? 30,
          height: widget.height ?? 30,
          child: SvgPicture.network(
            widget.url!,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: widget.width ?? 30,
        height: widget.height ?? 30,
        child: Image.network(
          widget.url!,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const SizedBox(),
        ),
      ),
    );
  }
}

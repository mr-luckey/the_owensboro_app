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

import 'package:marquee/marquee.dart';

class ScrollableTextWidget extends StatefulWidget {
  const ScrollableTextWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<ScrollableTextWidget> createState() => _ScrollableTextWidgetState();
}

class _ScrollableTextWidgetState extends State<ScrollableTextWidget> with GetxStatefulStateMixin {
  String concatenatedBannerNames = "";

  @override
  void initState() {
    super.initState();
    fetchBannerNames();
  }

  Future<void> fetchBannerNames() async {
    try {
      final firestore = FirebaseFirestore.instance;
      final querySnapshot = await firestore.collection('Banner').get();

      List<String> bannerNames = querySnapshot.docs
          .map((doc) => doc['bannerName'].toString())
          .toList();

      // Add star before each and add some fixed space separator
      String result =
          bannerNames.map((name) => "✦ $name ✦").join("\u2003\u2003\u2003");

      safeSetState(() {
        concatenatedBannerNames = result;
      });
    } catch (e) {
      print("Error fetching banners: $e");
      safeSetState(() {
        concatenatedBannerNames = "Error loading banners";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 50,
      // color: Colors.white,
      color: FlutterFlowTheme.of(context).secondaryBackground,
      child: concatenatedBannerNames.isEmpty
          ? Center(
              child: Text("Loading banners...",
                  style: TextStyle(color: Colors.white)))
          : Marquee(
              text: concatenatedBannerNames,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).dashboardSelection,
                fontSize: 18,
                fontFamily: 'Courier', // monospace font for consistent spacing
              ),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              blankSpace: 100,
              velocity: 100,
              pauseAfterRound: Duration(seconds: 1),
              startPadding: 10.0,
              accelerationDuration: Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
    );
  }
}

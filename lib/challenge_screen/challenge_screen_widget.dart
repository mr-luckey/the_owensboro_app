import 'package:get/get.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'controller/challenge_screen_controller.dart';
import 'challenge_screen_model.dart';
export 'challenge_screen_model.dart';

class ChallengeScreenWidget extends StatefulWidget {
  const ChallengeScreenWidget({super.key});

  static String routeName = 'ChallengeScreen';
  static String routePath = '/challengeScreen';

  @override
  State<ChallengeScreenWidget> createState() => _ChallengeScreenWidgetState();
}

class _ChallengeScreenWidgetState extends State<ChallengeScreenWidget> {
  late ChallengeScreenController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.find<ChallengeScreenController>();
    _controller.initModel(context);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChallengeScreenController>(
      builder: (controller) {
        if (controller.model == null) {
          return const SizedBox.shrink();
        }
        return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF252932),
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).secondary),
          automaticallyImplyLeading: true,
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: custom_widgets.UserChallengeCustomWidget(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
      },
    );
  }
}

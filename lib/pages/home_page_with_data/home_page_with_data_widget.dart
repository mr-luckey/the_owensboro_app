import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controller/home_page_with_data_controller.dart';
export 'home_page_with_data_model.dart';

class HomePageWithDataWidget extends StatefulWidget {
  const HomePageWithDataWidget({super.key});

  static String routeName = 'HomePageWithData';
  static String routePath = '/homePageWithData';

  @override
  State<HomePageWithDataWidget> createState() => _HomePageWithDataWidgetState();
}

class _HomePageWithDataWidgetState extends State<HomePageWithDataWidget> {
  late final HomePageWithDataController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.find<HomePageWithDataController>();
    _controller.initModel(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: _controller.scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<CatagoriesRecord>>(
            stream: queryCatagoriesRecord(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<CatagoriesRecord> gridViewCatagoriesRecordList =
                  snapshot.data!;

              return GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 3;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 4;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 5;
                    } else {
                      return 6;
                    }
                  }(),
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: gridViewCatagoriesRecordList.length,
                itemBuilder: (context, gridViewIndex) {
                  final gridViewCatagoriesRecord =
                      gridViewCatagoriesRecordList[gridViewIndex];
                  return Stack(
                    children: [
                      ClipRect(
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 1.0,
                            sigmaY: 1.0,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.SvgNetworkImage(
                              width: double.infinity,
                              height: double.infinity,
                              url: gridViewCatagoriesRecord.image,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          gridViewCatagoriesRecord.catagoryName,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).inputColor,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

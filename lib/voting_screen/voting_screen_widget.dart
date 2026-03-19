import 'package:get/get.dart';
import 'package:the_owensboro_app/widgets/app_end_drawer.dart';
import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/components/alert_login_sign_up_widget.dart';
import '/components/delete_user_alert_widget.dart';
import '/components/logout_alert_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'voting_screen_model.dart';
export 'voting_screen_model.dart';

class VotingScreenWidget extends StatefulWidget {
  const VotingScreenWidget({super.key});

  static String routeName = 'VotingScreen';
  static String routePath = '/votingScreen';

  @override
  State<VotingScreenWidget> createState() => _VotingScreenWidgetState();
}

class _VotingScreenWidgetState extends State<VotingScreenWidget> {
  late VotingScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VotingScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        endDrawer: AppEndDrawer(
          scaffoldKey: scaffoldKey,
          selectedTab: _model.selectedTab,
          onSelectedTabChanged: (value) {
            _model.selectedTab = value;
            safeSetState(() {});
          },
        ),
        // endDrawer: Drawer(
        //   elevation: 16.0,
        //   child: Container(
        //     width: MediaQuery.sizeOf(context).width * 2.0,
        //     height: 100.0,
        //     decoration: BoxDecoration(
        //       color: FlutterFlowTheme.of(context).primaryBackground,
        //     ),
        //     child: Padding(
        //       padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        //       child: Column(
        //         mainAxisSize: MainAxisSize.max,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Align(
        //             alignment: AlignmentDirectional(1.0, -1.0),
        //             child: Padding(
        //               padding:
        //                   EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
        //               child: InkWell(
        //                 splashColor: Colors.transparent,
        //                 focusColor: Colors.transparent,
        //                 hoverColor: Colors.transparent,
        //                 highlightColor: Colors.transparent,
        //                 onTap: () async {
        //                   if (scaffoldKey.currentState!.isDrawerOpen ||
        //                       scaffoldKey.currentState!.isEndDrawerOpen) {
        //                     Get.back();
        //                   }
        //                 },
        //                 child: Icon(
        //                   Icons.menu,
        //                   color: FlutterFlowTheme.of(context).primary,
        //                   size: 50.0,
        //                 ),
        //               ),
        //             ),
        //           ),
        //           Padding(
        //             padding: EdgeInsets.all(20.0),
        //             child: InkWell(
        //               splashColor: Colors.transparent,
        //               focusColor: Colors.transparent,
        //               hoverColor: Colors.transparent,
        //               highlightColor: Colors.transparent,
        //               onTap: () async {
        //                 _model.selectedTab = 'HOME';
        //                 safeSetState(() {});

        //                 Get.toNamed(HomePageWidget.routePath);
        //               },
        //               child: Text(
        //                 'HOME',
        //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
        //                       font: GoogleFonts.inter(
        //                         fontWeight: FontWeight.w600,
        //                         fontStyle: FlutterFlowTheme.of(context)
        //                             .bodyMedium
        //                             .fontStyle,
        //                       ),
        //                       color: _model.selectedTab == 'HOME'
        //                           ? FlutterFlowTheme.of(context).primary
        //                           : FlutterFlowTheme.of(context)
        //                               .secondaryBackground,
        //                       fontSize: 20.0,
        //                       letterSpacing: 0.0,
        //                       fontWeight: FontWeight.w600,
        //                       fontStyle: FlutterFlowTheme.of(context)
        //                           .bodyMedium
        //                           .fontStyle,
        //                     ),
        //               ),
        //             ),
        //           ),
        //           Builder(
        //             builder: (context) => Padding(
        //               padding: EdgeInsets.all(20.0),
        //               child: InkWell(
        //                 splashColor: Colors.transparent,
        //                 focusColor: Colors.transparent,
        //                 hoverColor: Colors.transparent,
        //                 highlightColor: Colors.transparent,
        //                 onTap: () async {
        //                   _model.selectedTab = 'Wheel of Adventure';
        //                   safeSetState(() {});
        //                   await showDialog(
        //                     context: context,
        //                     builder: (dialogContext) {
        //                       return Dialog(
        //                         elevation: 0,
        //                         insetPadding: EdgeInsets.zero,
        //                         backgroundColor: Colors.transparent,
        //                         alignment: AlignmentDirectional(0.0, 0.0)
        //                             .resolve(Directionality.of(context)),
        //                         child: GestureDetector(
        //                           onTap: () {
        //                             FocusScope.of(dialogContext).unfocus();
        //                             FocusManager.instance.primaryFocus
        //                                 ?.unfocus();
        //                           },
        //                           child: Container(
        //                             height:
        //                                 MediaQuery.sizeOf(context).height * 0.3,
        //                             width:
        //                                 MediaQuery.sizeOf(context).width * 0.35,
        //                             child: AlertLoginSignUpWidget(),
        //                           ),
        //                         ),
        //                       );
        //                     },
        //                   );
        //                 },
        //                 child: Text(
        //                   'Spin',
        //                   style: FlutterFlowTheme.of(context)
        //                       .bodyMedium
        //                       .override(
        //                         font: GoogleFonts.inter(
        //                           fontWeight: FontWeight.w600,
        //                           fontStyle: FlutterFlowTheme.of(context)
        //                               .bodyMedium
        //                               .fontStyle,
        //                         ),
        //                         color:
        //                             _model.selectedTab == 'Wheel of Adventure'
        //                                 ? FlutterFlowTheme.of(context).primary
        //                                 : FlutterFlowTheme.of(context)
        //                                     .secondaryBackground,
        //                         fontSize: 20.0,
        //                         letterSpacing: 0.0,
        //                         fontWeight: FontWeight.w600,
        //                         fontStyle: FlutterFlowTheme.of(context)
        //                             .bodyMedium
        //                             .fontStyle,
        //                       ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //           Padding(
        //             padding: EdgeInsets.all(20.0),
        //             child: InkWell(
        //               splashColor: Colors.transparent,
        //               focusColor: Colors.transparent,
        //               hoverColor: Colors.transparent,
        //               highlightColor: Colors.transparent,
        //               onTap: () async {
        //                 _model.selectedTab = 'CUSTOMER SERVICES';
        //                 safeSetState(() {});

        //                 Get.toNamed(ContactUsWidget.routePath);
        //               },
        //               child: Text(
        //                 'CUSTOMER SERVICES',
        //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
        //                       font: GoogleFonts.inter(
        //                         fontWeight: FontWeight.w600,
        //                         fontStyle: FlutterFlowTheme.of(context)
        //                             .bodyMedium
        //                             .fontStyle,
        //                       ),
        //                       color: _model.selectedTab == 'CUSTOMER SERVICES'
        //                           ? FlutterFlowTheme.of(context).primary
        //                           : FlutterFlowTheme.of(context)
        //                               .secondaryBackground,
        //                       fontSize: 20.0,
        //                       letterSpacing: 0.0,
        //                       fontWeight: FontWeight.w600,
        //                       fontStyle: FlutterFlowTheme.of(context)
        //                           .bodyMedium
        //                           .fontStyle,
        //                     ),
        //               ),
        //             ),
        //           ),
        //           Column(
        //             mainAxisSize: MainAxisSize.max,
        //             children: [
        //               Row(
        //                 mainAxisSize: MainAxisSize.max,
        //                 children: [
        //                   Align(
        //                     alignment: AlignmentDirectional(0.0, 0.0),
        //                     child: Padding(
        //                       padding: EdgeInsets.all(20.0),
        //                       child: InkWell(
        //                         splashColor: Colors.transparent,
        //                         focusColor: Colors.transparent,
        //                         hoverColor: Colors.transparent,
        //                         highlightColor: Colors.transparent,
        //                         onTap: () async {
        //                           Get.toNamed(UserSideSignUpScreenWidget.routePath);
        //                         },
        //                         child: Text(
        //                           'Sign Up',
        //                           style: FlutterFlowTheme.of(context)
        //                               .bodyMedium
        //                               .override(
        //                                 font: GoogleFonts.inter(
        //                                   fontWeight: FontWeight.w600,
        //                                   fontStyle:
        //                                       FlutterFlowTheme.of(context)
        //                                           .bodyMedium
        //                                           .fontStyle,
        //                                 ),
        //                                 color:
        //                                     FlutterFlowTheme.of(context).error,
        //                                 fontSize: 20.0,
        //                                 letterSpacing: 0.0,
        //                                 fontWeight: FontWeight.w600,
        //                                 fontStyle: FlutterFlowTheme.of(context)
        //                                     .bodyMedium
        //                                     .fontStyle,
        //                               ),
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                   Align(
        //                     alignment: AlignmentDirectional(0.0, 0.0),
        //                     child: Padding(
        //                       padding: EdgeInsets.all(20.0),
        //                       child: Text(
        //                         '/',
        //                         style: FlutterFlowTheme.of(context)
        //                             .bodyMedium
        //                             .override(
        //                               font: GoogleFonts.inter(
        //                                 fontWeight: FontWeight.w600,
        //                                 fontStyle: FlutterFlowTheme.of(context)
        //                                     .bodyMedium
        //                                     .fontStyle,
        //                               ),
        //                               color: FlutterFlowTheme.of(context).error,
        //                               fontSize: 20.0,
        //                               letterSpacing: 0.0,
        //                               fontWeight: FontWeight.w600,
        //                               fontStyle: FlutterFlowTheme.of(context)
        //                                   .bodyMedium
        //                                   .fontStyle,
        //                             ),
        //                       ),
        //                     ),
        //                   ),
        //                   Align(
        //                     alignment: AlignmentDirectional(0.0, 0.0),
        //                     child: Padding(
        //                       padding: EdgeInsets.all(20.0),
        //                       child: InkWell(
        //                         splashColor: Colors.transparent,
        //                         focusColor: Colors.transparent,
        //                         hoverColor: Colors.transparent,
        //                         highlightColor: Colors.transparent,
        //                         onTap: () async {
        //                           Get.toNamed(UserSideLoginScreenWidget.routePath);
        //                         },
        //                         child: Text(
        //                           'Login',
        //                           style: FlutterFlowTheme.of(context)
        //                               .bodyMedium
        //                               .override(
        //                                 font: GoogleFonts.inter(
        //                                   fontWeight: FontWeight.w600,
        //                                   fontStyle:
        //                                       FlutterFlowTheme.of(context)
        //                                           .bodyMedium
        //                                           .fontStyle,
        //                                 ),
        //                                 color:
        //                                     FlutterFlowTheme.of(context).error,
        //                                 fontSize: 20.0,
        //                                 letterSpacing: 0.0,
        //                                 fontWeight: FontWeight.w600,
        //                                 fontStyle: FlutterFlowTheme.of(context)
        //                                     .bodyMedium
        //                                     .fontStyle,
        //                               ),
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               if (loggedIn)
        //                 Align(
        //                   alignment: AlignmentDirectional(0.0, 0.0),
        //                   child: Builder(
        //                     builder: (context) => Padding(
        //                       padding: EdgeInsets.all(20.0),
        //                       child: InkWell(
        //                         splashColor: Colors.transparent,
        //                         focusColor: Colors.transparent,
        //                         hoverColor: Colors.transparent,
        //                         highlightColor: Colors.transparent,
        //                         onTap: () async {
        //                           await showDialog(
        //                             context: context,
        //                             builder: (dialogContext) {
        //                               return Dialog(
        //                                 elevation: 0,
        //                                 insetPadding: EdgeInsets.zero,
        //                                 backgroundColor: Colors.transparent,
        //                                 alignment:
        //                                     AlignmentDirectional(0.0, 0.0)
        //                                         .resolve(
        //                                             Directionality.of(context)),
        //                                 child: GestureDetector(
        //                                   onTap: () {
        //                                     FocusScope.of(dialogContext)
        //                                         .unfocus();
        //                                     FocusManager.instance.primaryFocus
        //                                         ?.unfocus();
        //                                   },
        //                                   child: Container(
        //                                     height: 200.0,
        //                                     width: MediaQuery.sizeOf(context)
        //                                             .width *
        //                                         0.5,
        //                                     child: LogoutAlertWidget(),
        //                                   ),
        //                                 ),
        //                               );
        //                             },
        //                           );
        //                         },
        //                         child: Text(
        //                           'Log Out',
        //                           style: FlutterFlowTheme.of(context)
        //                               .bodyMedium
        //                               .override(
        //                                 font: GoogleFonts.inter(
        //                                   fontWeight: FontWeight.w600,
        //                                   fontStyle:
        //                                       FlutterFlowTheme.of(context)
        //                                           .bodyMedium
        //                                           .fontStyle,
        //                                 ),
        //                                 color:
        //                                     FlutterFlowTheme.of(context).error,
        //                                 fontSize: 20.0,
        //                                 letterSpacing: 0.0,
        //                                 fontWeight: FontWeight.w600,
        //                                 fontStyle: FlutterFlowTheme.of(context)
        //                                     .bodyMedium
        //                                     .fontStyle,
        //                               ),
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               if (loggedIn)
        //                 Align(
        //                   alignment: AlignmentDirectional(0.0, 0.0),
        //                   child: Builder(
        //                     builder: (context) => Padding(
        //                       padding: EdgeInsets.all(20.0),
        //                       child: InkWell(
        //                         splashColor: Colors.transparent,
        //                         focusColor: Colors.transparent,
        //                         hoverColor: Colors.transparent,
        //                         highlightColor: Colors.transparent,
        //                         onTap: () async {
        //                           await showDialog(
        //                             context: context,
        //                             builder: (dialogContext) {
        //                               return Dialog(
        //                                 elevation: 0,
        //                                 insetPadding: EdgeInsets.zero,
        //                                 backgroundColor: Colors.transparent,
        //                                 alignment:
        //                                     AlignmentDirectional(0.0, 0.0)
        //                                         .resolve(
        //                                             Directionality.of(context)),
        //                                 child: GestureDetector(
        //                                   onTap: () {
        //                                     FocusScope.of(dialogContext)
        //                                         .unfocus();
        //                                     FocusManager.instance.primaryFocus
        //                                         ?.unfocus();
        //                                   },
        //                                   child: Container(
        //                                     height: 220.0,
        //                                     width: MediaQuery.sizeOf(context)
        //                                             .width *
        //                                         0.55,
        //                                     child: DeleteUserAlertWidget(),
        //                                   ),
        //                                 ),
        //                               );
        //                             },
        //                           );
        //                         },
        //                         child: Text(
        //                           'Delete Account',
        //                           style: FlutterFlowTheme.of(context)
        //                               .bodyMedium
        //                               .override(
        //                                 font: GoogleFonts.inter(
        //                                   fontWeight: FontWeight.w600,
        //                                   fontStyle:
        //                                       FlutterFlowTheme.of(context)
        //                                           .bodyMedium
        //                                           .fontStyle,
        //                                 ),
        //                                 color:
        //                                     FlutterFlowTheme.of(context).error,
        //                                 fontSize: 20.0,
        //                                 letterSpacing: 0.0,
        //                                 fontWeight: FontWeight.w600,
        //                                 fontStyle: FlutterFlowTheme.of(context)
        //                                     .bodyMedium
        //                                     .fontStyle,
        //                               ),
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),

        appBar: MediaQuery.sizeOf(context).width >= 450.0
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        Get.back();
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'The Owensboro App',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).textColor,
                              fontSize: 32.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ],
                ),
                actions: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Get.toNamed(HomePageDynamicWidget.routePath);
                          },
                          child: Container(
                            width: 100.0,
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Text(
                                  'HOME',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .textColor,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.3,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.35,
                                        child: AlertLoginSignUpWidget(),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: 200.0,
                              height: 40.0,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    'Spin',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .textColor,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Get.toNamed(ContactUsWidget.routePath);
                          },
                          child: Container(
                            width: 200.0,
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Text(
                                  'CUSTOMER SERVICE',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .textColor,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Rectangle_84.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                centerTitle: false,
                elevation: 1.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 10.0),
                              child: Text(
                                'Vote For Your Favorite',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: StreamBuilder<List<VoteRecord>>(
                                stream: queryVoteRecord(
                                  queryBuilder: (voteRecord) =>
                                      voteRecord.orderBy('link'),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<VoteRecord> textVoteRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final textVoteRecord =
                                      textVoteRecordList.isNotEmpty
                                          ? textVoteRecordList.first
                                          : null;

                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await launchURL(textVoteRecord!.link);
                                    },
                                    child: Text(
                                      valueOrDefault<String>(
                                        textVoteRecord?.link,
                                        'link',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .textColor,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Bottom navigation bar intentionally disabled on voting screen.
            ],
          ),
        ),
      ),
    );
  }
}

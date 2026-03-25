// import '/auth/base_auth_user_provider.dart';
// import '/auth/firebase_auth/auth_util.dart';
// import '/backend/backend.dart';
// import '/components/alert_login_sign_up_widget.dart';
// import '/components/delete_user_alert_widget.dart';
// import '/components/logout_alert_widget.dart';
// import '/flutter_flow/flutter_flow_animations.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// // import '/components/bottom_nav_bar_widget.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// // import 'dart:math';
// import 'dart:ui';
// import '/custom_code/widgets/index.dart' as custom_widgets;
// import '/index.dart';
// // import '/main.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:get/get.dart';
// // import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'controller/home_page_dynamic_controller.dart';
import 'home_page_dynamic_model.dart';
// export 'home_page_dynamic_model.dart';

// class HomePageDynamicWidget extends StatefulWidget {
//   const HomePageDynamicWidget({super.key});

//   static String routeName = 'HomePageDynamic';
//   static String routePath = '/homePageDynamic';

//   @override
//   State<HomePageDynamicWidget> createState() => _HomePageDynamicWidgetState();
// }

// class _HomePageDynamicWidgetState extends State<HomePageDynamicWidget>
//     with TickerProviderStateMixin {
//   late HomePageDynamicModel model;

//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   final animationsMap = <String, AnimationInfo>{};

//   @override
//   void initState() {
//     super.initState();
//     model = createModel(context, () => HomePageDynamicModel());

//     // On page load action.
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       setDarkModeSetting(context, ThemeMode.light);
//       if (controller.scaffoldKey.currentState!.isDrawerOpen ||
//           controller.scaffoldKey.currentState!.isEndDrawerOpen) {
//         Get.back();
//       }

//       model.selectedTab = 'HOME';
//       controller.notifyUi();

//       // Notify root app that the first home frame is ready so it can hide splash.
//       AppStateNotifier.instance.showSplashImage = false;
//       controller.notifyUi();
//     });

//     model.textController1 ??= TextEditingController();
//     model.textFieldFocusNode1 ??= FocusNode();

//     model.textController2 ??= TextEditingController();
//     model.textFieldFocusNode2 ??= FocusNode();

//     model.textController3 ??= TextEditingController();
//     model.textFieldFocusNode3 ??= FocusNode();

//     model.textController4 ??= TextEditingController();
//     model.textFieldFocusNode4 ??= FocusNode();

//     model.textController5 ??= TextEditingController();
//     model.textFieldFocusNode5 ??= FocusNode();

//     model.textController6 ??= TextEditingController();
//     model.textFieldFocusNode6 ??= FocusNode();

//     animationsMap.addAll({
//       'columnOnPageLoadAnimation': AnimationInfo(
//         trigger: AnimationTrigger.onPageLoad,
//         effectsBuilder: () => [
//           FadeEffect(
//             curve: Curves.easeInOut,
//             delay: 0.0.ms,
//             duration: 640.0.ms,
//             begin: 0.0,
//             end: 1.0,
//           ),
//         ],
//       ),
//     });

//     WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//           FocusManager.instance.primaryFocus?.unfocus();
//         },
//         child: Scaffold(
//           key: scaffoldKey,
//           backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//           endDrawer: Drawer(
//             elevation: 16.0,
//             child: Container(
//               width: MediaQuery.sizeOf(context).width * 2.0,
//               height: 100.0,
//               decoration: BoxDecoration(
//                 color: FlutterFlowTheme.of(context).primaryBackground,
//               ),
//               child: Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Align(
//                       alignment: AlignmentDirectional(1.0, -1.0),
//                       child: Padding(
//                         padding:
//                             EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
//                         child: InkWell(
//                           splashColor: Colors.transparent,
//                           focusColor: Colors.transparent,
//                           hoverColor: Colors.transparent,
//                           highlightColor: Colors.transparent,
//                           onTap: () async {
//                             if (controller.scaffoldKey.currentState!.isDrawerOpen ||
//                                 controller.scaffoldKey.currentState!.isEndDrawerOpen) {
//                               Get.back();
//                             }
//                           },
//                           child: Icon(
//                             Icons.menu,
//                             color: FlutterFlowTheme.of(context).primary,
//                             size: 50.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(20.0),
//                       child: InkWell(
//                         splashColor: Colors.transparent,
//                         focusColor: Colors.transparent,
//                         hoverColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         onTap: () async {
//                           model.selectedTab = 'HOME';
//                           controller.notifyUi();

//                           Get.toNamed(HomePageDynamicWidget.routePath);
//                         },
//                         child: Text(
//                           'HOME',
//                           style:
//                               FlutterFlowTheme.of(context).bodyMedium.override(
//                                     font: GoogleFonts.inter(
//                                       fontWeight: FontWeight.w600,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontStyle,
//                                     ),
//                                     color: model.selectedTab == 'HOME'
//                                         ? FlutterFlowTheme.of(context).primary
//                                         : FlutterFlowTheme.of(context)
//                                             .secondaryBackground,
//                                     fontSize: 20.0,
//                                     letterSpacing: 0.0,
//                                     fontWeight: FontWeight.w600,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .bodyMedium
//                                         .fontStyle,
//                                   ),
//                         ),
//                       ),
//                     ),
//                     Builder(
//                       builder: (context) => Padding(
//                         padding: EdgeInsets.all(20.0),
//                         child: InkWell(
//                           splashColor: Colors.transparent,
//                           focusColor: Colors.transparent,
//                           hoverColor: Colors.transparent,
//                           highlightColor: Colors.transparent,
//                           onTap: () async {
//                             model.selectedTab = 'Wheel of Adventure';
//                             controller.notifyUi();
//                             if (loggedIn) {
//                               Get.toNamed(WheelAdventureScreenWidget.routePath);

//                               if (controller.scaffoldKey.currentState!.isDrawerOpen ||
//                                   controller.scaffoldKey.currentState!.isEndDrawerOpen) {
//                                 Get.back();
//                               }

//                               model.selectedTab = '.';
//                               controller.notifyUi();
//                               return;
//                             } else {
//                               await showDialog(
//                                 context: context,
//                                 builder: (dialogContext) {
//                                   return Dialog(
//                                     elevation: 0,
//                                     insetPadding: EdgeInsets.zero,
//                                     backgroundColor: Colors.transparent,
//                                     alignment: AlignmentDirectional(0.0, 0.0)
//                                         .resolve(Directionality.of(context)),
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         FocusScope.of(dialogContext).unfocus();
//                                         FocusManager.instance.primaryFocus
//                                             ?.unfocus();
//                                       },
//                                       child: Container(
//                                         height:
//                                             MediaQuery.sizeOf(context).height *
//                                                 0.3,
//                                         width:
//                                             MediaQuery.sizeOf(context).width *
//                                                 0.35,
//                                         child: AlertLoginSignUpWidget(),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               );

//                               return;
//                             }
//                           },
//                           child: Text(
//                             'Spin',
//                             style: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .override(
//                                   font: GoogleFonts.inter(
//                                     fontWeight: FontWeight.w600,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .bodyMedium
//                                         .fontStyle,
//                                   ),
//                                   color:
//                                       model.selectedTab == 'Wheel of Adventure'
//                                           ? FlutterFlowTheme.of(context).primary
//                                           : FlutterFlowTheme.of(context)
//                                               .secondaryBackground,
//                                   fontSize: 20.0,
//                                   letterSpacing: 0.0,
//                                   fontWeight: FontWeight.w600,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .bodyMedium
//                                       .fontStyle,
//                                 ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(20.0),
//                       child: InkWell(
//                         splashColor: Colors.transparent,
//                         focusColor: Colors.transparent,
//                         hoverColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         onTap: () async {
//                           model.selectedTab = 'CUSTOMER SERVICES';
//                           controller.notifyUi();

//                           Get.toNamed(ContactUsWidget.routePath);
//                         },
//                         child: Text(
//                           'CUSTOMER SERVICES',
//                           style: FlutterFlowTheme.of(context)
//                               .bodyMedium
//                               .override(
//                                 font: GoogleFonts.inter(
//                                   fontWeight: FontWeight.w600,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .bodyMedium
//                                       .fontStyle,
//                                 ),
//                                 color: model.selectedTab == 'CUSTOMER SERVICES'
//                                     ? FlutterFlowTheme.of(context).primary
//                                     : FlutterFlowTheme.of(context)
//                                         .secondaryBackground,
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
//                     Column(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Row(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Align(
//                               alignment: AlignmentDirectional(0.0, 0.0),
//                               child: Padding(
//                                 padding: EdgeInsets.all(20.0),
//                                 child: InkWell(
//                                   splashColor: Colors.transparent,
//                                   focusColor: Colors.transparent,
//                                   hoverColor: Colors.transparent,
//                                   highlightColor: Colors.transparent,
//                                   onTap: () async {
//                                     Get.toNamed(
//                                         UserSideSignUpScreenWidget.routePath);
//                                   },
//                                   child: Text(
//                                     'Sign Up',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyMedium
//                                         .override(
//                                           font: GoogleFonts.inter(
//                                             fontWeight: FontWeight.w600,
//                                             fontStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodyMedium
//                                                     .fontStyle,
//                                           ),
//                                           color: FlutterFlowTheme.of(context)
//                                               .error,
//                                           fontSize: 20.0,
//                                           letterSpacing: 0.0,
//                                           fontWeight: FontWeight.w600,
//                                           fontStyle:
//                                               FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .fontStyle,
//                                         ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: AlignmentDirectional(0.0, 0.0),
//                               child: Padding(
//                                 padding: EdgeInsets.all(20.0),
//                                 child: Text(
//                                   '/',
//                                   style: FlutterFlowTheme.of(context)
//                                       .bodyMedium
//                                       .override(
//                                         font: GoogleFonts.inter(
//                                           fontWeight: FontWeight.w600,
//                                           fontStyle:
//                                               FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .fontStyle,
//                                         ),
//                                         color: model.selectedTab ==
//                                                 'CUSTOMER SERVICES'
//                                             ? FlutterFlowTheme.of(context).error
//                                             : FlutterFlowTheme.of(context)
//                                                 .error,
//                                         fontSize: 20.0,
//                                         letterSpacing: 0.0,
//                                         fontWeight: FontWeight.w600,
//                                         fontStyle: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontStyle,
//                                       ),
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: AlignmentDirectional(0.0, 0.0),
//                               child: Padding(
//                                 padding: EdgeInsets.all(20.0),
//                                 child: InkWell(
//                                   splashColor: Colors.transparent,
//                                   focusColor: Colors.transparent,
//                                   hoverColor: Colors.transparent,
//                                   highlightColor: Colors.transparent,
//                                   onTap: () async {
//                                     Get.toNamed(
//                                         UserSideLoginScreenWidget.routePath);
//                                   },
//                                   child: Text(
//                                     'Login',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyMedium
//                                         .override(
//                                           font: GoogleFonts.inter(
//                                             fontWeight: FontWeight.w600,
//                                             fontStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodyMedium
//                                                     .fontStyle,
//                                           ),
//                                           color: FlutterFlowTheme.of(context)
//                                               .error,
//                                           fontSize: 20.0,
//                                           letterSpacing: 0.0,
//                                           fontWeight: FontWeight.w600,
//                                           fontStyle:
//                                               FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .fontStyle,
//                                         ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         if (loggedIn)
//                           Align(
//                             alignment: AlignmentDirectional(0.0, 0.0),
//                             child: Builder(
//                               builder: (context) => Padding(
//                                 padding: EdgeInsets.all(20.0),
//                                 child: InkWell(
//                                   splashColor: Colors.transparent,
//                                   focusColor: Colors.transparent,
//                                   hoverColor: Colors.transparent,
//                                   highlightColor: Colors.transparent,
//                                   onTap: () async {
//                                     await showDialog(
//                                       context: context,
//                                       builder: (dialogContext) {
//                                         return Dialog(
//                                           elevation: 0,
//                                           insetPadding: EdgeInsets.zero,
//                                           backgroundColor: Colors.transparent,
//                                           alignment: AlignmentDirectional(
//                                                   0.0, 0.0)
//                                               .resolve(
//                                                   Directionality.of(context)),
//                                           child: GestureDetector(
//                                             onTap: () {
//                                               FocusScope.of(dialogContext)
//                                                   .unfocus();
//                                               FocusManager.instance.primaryFocus
//                                                   ?.unfocus();
//                                             },
//                                             child: Container(
//                                               height: 200.0,
//                                               width: MediaQuery.sizeOf(context)
//                                                       .width *
//                                                   0.5,
//                                               child: LogoutAlertWidget(),
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     );
//                                   },
//                                   child: Text(
//                                     'Log Out',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyMedium
//                                         .override(
//                                           font: GoogleFonts.inter(
//                                             fontWeight: FontWeight.w600,
//                                             fontStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodyMedium
//                                                     .fontStyle,
//                                           ),
//                                           color: FlutterFlowTheme.of(context)
//                                               .error,
//                                           fontSize: 20.0,
//                                           letterSpacing: 0.0,
//                                           fontWeight: FontWeight.w600,
//                                           fontStyle:
//                                               FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .fontStyle,
//                                         ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         if (loggedIn)
//                           Align(
//                             alignment: AlignmentDirectional(0.0, 0.0),
//                             child: Builder(
//                               builder: (context) => Padding(
//                                 padding: EdgeInsets.all(20.0),
//                                 child: InkWell(
//                                   splashColor: Colors.transparent,
//                                   focusColor: Colors.transparent,
//                                   hoverColor: Colors.transparent,
//                                   highlightColor: Colors.transparent,
//                                   onTap: () async {
//                                     await showDialog(
//                                       context: context,
//                                       builder: (dialogContext) {
//                                         return Dialog(
//                                           elevation: 0,
//                                           insetPadding: EdgeInsets.zero,
//                                           backgroundColor: Colors.transparent,
//                                           alignment: AlignmentDirectional(
//                                                   0.0, 0.0)
//                                               .resolve(
//                                                   Directionality.of(context)),
//                                           child: GestureDetector(
//                                             onTap: () {
//                                               FocusScope.of(dialogContext)
//                                                   .unfocus();
//                                               FocusManager.instance.primaryFocus
//                                                   ?.unfocus();
//                                             },
//                                             child: Container(
//                                               height: 220.0,
//                                               width: MediaQuery.sizeOf(context)
//                                                       .width *
//                                                   0.55,
//                                               child: DeleteUserAlertWidget(),
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     );
//                                   },
//                                   child: Text(
//                                     'Delete Account',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyMedium
//                                         .override(
//                                           font: GoogleFonts.inter(
//                                             fontWeight: FontWeight.w600,
//                                             fontStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodyMedium
//                                                     .fontStyle,
//                                           ),
//                                           color: FlutterFlowTheme.of(context)
//                                               .error,
//                                           fontSize: 20.0,
//                                           letterSpacing: 0.0,
//                                           fontWeight: FontWeight.w600,
//                                           fontStyle:
//                                               FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .fontStyle,
//                                         ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                     Spacer(),
//                     Padding(
//                       padding:
//                           EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                                 20.0, 0.0, 0.0, 0.0),
//                             child: InkWell(
//                               splashColor: Colors.transparent,
//                               focusColor: Colors.transparent,
//                               hoverColor: Colors.transparent,
//                               highlightColor: Colors.transparent,
//                               onTap: () async {
//                                 Get.toNamed(PrivacyPageWidget.routePath);
//                               },
//                               child: Text(
//                                 'PRIVACY POLICY',
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       font: GoogleFonts.inter(
//                                         fontWeight: FontWeight.w600,
//                                         fontStyle: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontStyle,
//                                       ),
//                                       color: model.selectedTab ==
//                                               'CUSTOMER SERVICES'
//                                           ? FlutterFlowTheme.of(context).primary
//                                           : FlutterFlowTheme.of(context)
//                                               .secondaryBackground,
//                                       fontSize: 10.0,
//                                       letterSpacing: 0.0,
//                                       fontWeight: FontWeight.w600,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontStyle,
//                                     ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                             child: VerticalDivider(
//                               thickness: 2.0,
//                               color: FlutterFlowTheme.of(context).alternate,
//                             ),
//                           ),
//                           Align(
//                             alignment: AlignmentDirectional(-1.0, 1.0),
//                             child: InkWell(
//                               splashColor: Colors.transparent,
//                               focusColor: Colors.transparent,
//                               hoverColor: Colors.transparent,
//                               highlightColor: Colors.transparent,
//                               onTap: () async {
//                                 Get.toNamed(TermConditionPageWidget.routePath);
//                               },
//                               child: Text(
//                                 'TERMS & CONDITION',
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       font: GoogleFonts.inter(
//                                         fontWeight: FontWeight.w600,
//                                         fontStyle: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontStyle,
//                                       ),
//                                       color: model.selectedTab ==
//                                               'CUSTOMER SERVICES'
//                                           ? FlutterFlowTheme.of(context).primary
//                                           : FlutterFlowTheme.of(context)
//                                               .secondaryBackground,
//                                       fontSize: 10.0,
//                                       letterSpacing: 0.0,
//                                       fontWeight: FontWeight.w600,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontStyle,
//                                     ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           appBar: MediaQuery.sizeOf(context).width >= 450.0
//               ? AppBar(
//                   backgroundColor:
//                       FlutterFlowTheme.of(context).primaryBackground,
//                   automaticallyImplyLeading: false,
//                   title: Padding(
//                     padding:
//                         EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
//                     child: Text(
//                       'The Owensboro App',
//                       style: FlutterFlowTheme.of(context).bodyMedium.override(
//                             font: GoogleFonts.inter(
//                               fontWeight: FontWeight.w600,
//                               fontStyle: FlutterFlowTheme.of(context)
//                                   .bodyMedium
//                                   .fontStyle,
//                             ),
//                             color: FlutterFlowTheme.of(context).textColor,
//                             fontSize: 32.0,
//                             letterSpacing: 0.0,
//                             fontWeight: FontWeight.w600,
//                             fontStyle: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .fontStyle,
//                           ),
//                     ),
//                   ),
//                   actions: [
//                     Padding(
//                       padding:
//                           EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {
//                               model.isSelected = true;
//                               model.selectedTab = 'HOME';
//                               controller.notifyUi();

//                               Get.toNamed(HomePageDynamicWidget.routePath);
//                             },
//                             child: Container(
//                               width: 100.0,
//                               height: 40.0,
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: model.selectedTab == 'HOME'
//                                       ? FlutterFlowTheme.of(context).primary
//                                       : FlutterFlowTheme.of(context)
//                                           .primaryBackground,
//                                 ),
//                               ),
//                               child: Align(
//                                 alignment: AlignmentDirectional(0.0, 0.0),
//                                 child: Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       10.0, 0.0, 10.0, 0.0),
//                                   child: Text(
//                                     'HOME',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyMedium
//                                         .override(
//                                           font: GoogleFonts.inter(
//                                             fontWeight:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodyMedium
//                                                     .fontWeight,
//                                             fontStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodyMedium
//                                                     .fontStyle,
//                                           ),
//                                           color: FlutterFlowTheme.of(context)
//                                               .textColor,
//                                           fontSize: 16.0,
//                                           letterSpacing: 0.0,
//                                           fontWeight:
//                                               FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .fontWeight,
//                                           fontStyle:
//                                               FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .fontStyle,
//                                         ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Builder(
//                             builder: (context) => InkWell(
//                               splashColor: Colors.transparent,
//                               focusColor: Colors.transparent,
//                               hoverColor: Colors.transparent,
//                               highlightColor: Colors.transparent,
//                               onTap: () async {
//                                 model.isSelected = true;
//                                 model.selectedTab = 'Wheel of Adventure';
//                                 controller.notifyUi();
//                                 if (loggedIn) {
//                                   Get.toNamed(
//                                       WheelAdventureScreenWidget.routePath);

//                                   return;
//                                 } else {
//                                   await showDialog(
//                                     context: context,
//                                     builder: (dialogContext) {
//                                       return Dialog(
//                                         elevation: 0,
//                                         insetPadding: EdgeInsets.zero,
//                                         backgroundColor: Colors.transparent,
//                                         alignment:
//                                             AlignmentDirectional(0.0, 0.0)
//                                                 .resolve(
//                                                     Directionality.of(context)),
//                                         child: GestureDetector(
//                                           onTap: () {
//                                             FocusScope.of(dialogContext)
//                                                 .unfocus();
//                                             FocusManager.instance.primaryFocus
//                                                 ?.unfocus();
//                                           },
//                                           child: Container(
//                                             height: MediaQuery.sizeOf(context)
//                                                     .height *
//                                                 0.3,
//                                             width: MediaQuery.sizeOf(context)
//                                                     .width *
//                                                 0.35,
//                                             child: AlertLoginSignUpWidget(),
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   );

//                                   return;
//                                 }
//                               },
//                               child: Container(
//                                 width: 200.0,
//                                 height: 40.0,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: model.selectedTab == 'VOTING'
//                                         ? FlutterFlowTheme.of(context).primary
//                                         : FlutterFlowTheme.of(context)
//                                             .primaryBackground,
//                                   ),
//                                 ),
//                                 child: Align(
//                                   alignment: AlignmentDirectional(0.0, 0.0),
//                                   child: Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         10.0, 0.0, 10.0, 0.0),
//                                     child: Text(
//                                       'Spin',
//                                       style: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .override(
//                                             font: GoogleFonts.inter(
//                                               fontWeight:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodyMedium
//                                                       .fontWeight,
//                                               fontStyle:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodyMedium
//                                                       .fontStyle,
//                                             ),
//                                             color: FlutterFlowTheme.of(context)
//                                                 .textColor,
//                                             fontSize: 16.0,
//                                             letterSpacing: 0.0,
//                                             fontWeight:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodyMedium
//                                                     .fontWeight,
//                                             fontStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodyMedium
//                                                     .fontStyle,
//                                           ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {
//                               model.isSelected = true;
//                               model.selectedTab = 'CUSTOMER SERVICE';
//                               controller.notifyUi();

//                               Get.toNamed(ContactUsWidget.routePath);
//                             },
//                             child: Container(
//                               width: 200.0,
//                               height: 40.0,
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color:
//                                       model.selectedTab == 'CUSTOMER SERVICE'
//                                           ? FlutterFlowTheme.of(context).primary
//                                           : FlutterFlowTheme.of(context)
//                                               .primaryBackground,
//                                 ),
//                               ),
//                               child: Align(
//                                 alignment: AlignmentDirectional(0.0, 0.0),
//                                 child: Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       10.0, 0.0, 10.0, 0.0),
//                                   child: Text(
//                                     'CUSTOMER SERVICE',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyMedium
//                                         .override(
//                                           font: GoogleFonts.inter(
//                                             fontWeight:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodyMedium
//                                                     .fontWeight,
//                                             fontStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodyMedium
//                                                     .fontStyle,
//                                           ),
//                                           color: FlutterFlowTheme.of(context)
//                                               .textColor,
//                                           fontSize: 16.0,
//                                           letterSpacing: 0.0,
//                                           fontWeight:
//                                               FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .fontWeight,
//                                           fontStyle:
//                                               FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .fontStyle,
//                                         ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {
//                               Get.toNamed(PrivacyPageWidget.routePath);
//                             },
//                             child: Container(
//                               width: 180.0,
//                               height: 40.0,
//                               decoration: BoxDecoration(),
//                               child: Align(
//                                 alignment: AlignmentDirectional(0.0, 0.0),
//                                 child: Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       10.0, 0.0, 10.0, 0.0),
//                                   child: Text(
//                                     'PRIVACY POLICY',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyMedium
//                                         .override(
//                                           font: GoogleFonts.inter(
//                                             fontWeight:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodyMedium
//                                                     .fontWeight,
//                                             fontStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodyMedium
//                                                     .fontStyle,
//                                           ),
//                                           color: FlutterFlowTheme.of(context)
//                                               .textColor,
//                                           fontSize: 16.0,
//                                           letterSpacing: 0.0,
//                                           fontWeight:
//                                               FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .fontWeight,
//                                           fontStyle:
//                                               FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .fontStyle,
//                                         ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {
//                               Get.toNamed(TermConditionPageWidget.routePath);
//                             },
//                             child: Container(
//                               width: 200.0,
//                               height: 40.0,
//                               decoration: BoxDecoration(),
//                               child: Align(
//                                 alignment: AlignmentDirectional(0.0, 0.0),
//                                 child: Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       10.0, 0.0, 10.0, 0.0),
//                                   child: Text(
//                                     'TERMS & CONDITION',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyMedium
//                                         .override(
//                                           font: GoogleFonts.inter(
//                                             fontWeight:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodyMedium
//                                                     .fontWeight,
//                                             fontStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodyMedium
//                                                     .fontStyle,
//                                           ),
//                                           color: FlutterFlowTheme.of(context)
//                                               .textColor,
//                                           fontSize: 16.0,
//                                           letterSpacing: 0.0,
//                                           fontWeight:
//                                               FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .fontWeight,
//                                           fontStyle:
//                                               FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .fontStyle,
//                                         ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {
//                               await authManager.signOut();

//                               Get.offAllNamed(HomePageDynamicWidget.routePath);
//                             },
//                             child: Icon(
//                               Icons.arrow_back,
//                               color: FlutterFlowTheme.of(context).primaryText,
//                               size: 24.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                   centerTitle: false,
//                   elevation: 0.0,
//                 )
//               : null,
//           body: SafeArea(
//             top: true,
//             child: CustomScrollView(slivers: [
//               SliverToBoxAdapter(
//                 child: Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       if (responsiveVisibility(
//                         context: context,
//                         tablet: false,
//                         tabletLandscape: false,
//                         desktop: false,
//                       ))
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(
//                               10.0, 0.0, 10.0, 10.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'The Owensboro App',
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       font: GoogleFonts.inter(
//                                         fontWeight: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontWeight,
//                                         fontStyle: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontStyle,
//                                       ),
//                                       color: FlutterFlowTheme.of(context)
//                                           .textColor,
//                                       fontSize: 24.0,
//                                       letterSpacing: 0.0,
//                                       fontWeight: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontWeight,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontStyle,
//                                     ),
//                               ),

//                               // Text(
//                               //   'Hello ',
//                               //   style: FlutterFlowTheme.of(context)
//                               //       .bodyMedium
//                               //       .override(
//                               //         font: GoogleFonts.inter(
//                               //           fontWeight: FlutterFlowTheme.of(context)
//                               //               .bodyMedium
//                               //               .fontWeight,
//                               //           fontStyle: FlutterFlowTheme.of(context)
//                               //               .bodyMedium
//                               //               .fontStyle,
//                               //         ),
//                               //         letterSpacing: 0.0,
//                               //         fontWeight: FlutterFlowTheme.of(context)
//                               //             .bodyMedium
//                               //             .fontWeight,
//                               //         fontStyle: FlutterFlowTheme.of(context)
//                               //             .bodyMedium
//                               //             .fontStyle,
//                               //       ),
//                               // ),
//                               // ClipRRect(
//                               //   borderRadius: BorderRadius.circular(8.0),
//                               //   child: Image.asset(
//                               //     'assets/images/Screenshot_2026-01-29_at_2.36.22_PM.png',
//                               //     width: 50.0,
//                               //     height: 50.0,
//                               //     fit: BoxFit.cover,
//                               //   ),
//                               // ),

//                               InkWell(
//                                 splashColor: Colors.transparent,
//                                 focusColor: Colors.transparent,
//                                 hoverColor: Colors.transparent,
//                                 highlightColor: Colors.transparent,
//                                 onTap: () async {
//                                   controller.scaffoldKey.currentState!.openEndDrawer();
//                                 },
//                                 child: Icon(
//                                   Icons.menu,
//                                   color: FlutterFlowTheme.of(context)
//                                       .secondaryBackground,
//                                   size: 34.0,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       Container(
//                         width: double.infinity,
//                         height: 200.0,
//                         decoration: BoxDecoration(),
//                         child: Stack(
//                           children: [
//                             Container(
//                               width: double.infinity,
//                               height: 200.0,
//                               child: CarouselSlider(
//                                 items: [
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                     child: Image.asset(
//                                       'assets/images/dji_fly_20240828_105236_25_1724872752150_photo.jpg',
//                                       width: 200.0,
//                                       height: 200.0,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                     child: Image.asset(
//                                       'assets/images/dji_fly_20240828_105236_25_1724872752150_photo.jpg',
//                                       width: 200.0,
//                                       height: 200.0,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                     child: Image.asset(
//                                       'assets/images/dji_fly_20240828_105236_25_1724872752150_photo.jpg',
//                                       width: 200.0,
//                                       height: 200.0,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ],
//                                 carouselController:
//                                     model.carouselController ??=
//                                         CarouselSliderController(),
//                                 options: CarouselOptions(
//                                   initialPage: 1,
//                                   viewportFraction: 1.0,
//                                   disableCenter: true,
//                                   enlargeCenterPage: true,
//                                   enlargeFactor: 0.25,
//                                   enableInfiniteScroll: true,
//                                   scrollDirection: Axis.horizontal,
//                                   autoPlay: true,
//                                   autoPlayAnimationDuration:
//                                       Duration(milliseconds: 800),
//                                   autoPlayInterval:
//                                       Duration(milliseconds: (800 + 4000)),
//                                   autoPlayCurve: Curves.linear,
//                                   pauseAutoPlayInFiniteScroll: true,
//                                   onPageChanged: (index, _) =>
//                                       model.carouselCurrentIndex = index,
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: AlignmentDirectional(0.0, 0.0),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         0.0, 20.0, 0.0, 0.0),
//                                     child: Container(
//                                       width: MediaQuery.sizeOf(context).width >=
//                                               450.0
//                                           ? 370.0
//                                           : 250.0,
//                                       height: 50.0,
//                                       child: custom_widgets.SearchWidget(
//                                         width:
//                                             MediaQuery.sizeOf(context).width >=
//                                                     450.0
//                                                 ? 370.0
//                                                 : 250.0,
//                                         height: 50.0,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SliverPersistentHeader(
//                 pinned: true,
//                 delegate: _BannerHeaderDelegate(
//                   child: StreamBuilder<List<BannerRecord>>(
//                     stream: queryBannerRecord(),
//                     builder: (context, snapshot) {
//                       if (!snapshot.hasData) {
//                         return const SizedBox.shrink();
//                       }
//                       return Container(
//                         width: double.infinity,
//                         height: 60.0,
//                         child: custom_widgets.ScrollableTextWidget(
//                           width: double.infinity,
//                           height: 60.0,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 child: Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       if (responsiveVisibility(
//                         context: context,
//                         tablet: false,
//                         tabletLandscape: false,
//                         desktop: false,
//                       ))
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(
//                               10.0, 0.0, 10.0, 10.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // Text(
//                               //   'The Owensboro App',
//                               //   style: FlutterFlowTheme.of(context)
//                               //       .bodyMedium
//                               //       .override(
//                               //         font: GoogleFonts.inter(
//                               //           fontWeight: FlutterFlowTheme.of(context)
//                               //               .bodyMedium
//                               //               .fontWeight,
//                               //           fontStyle: FlutterFlowTheme.of(context)
//                               //               .bodyMedium
//                               //               .fontStyle,
//                               //         ),
//                               //         color: FlutterFlowTheme.of(context).textColor,
//                               //         fontSize: 24.0,
//                               //         letterSpacing: 0.0,
//                               //         fontWeight: FlutterFlowTheme.of(context)
//                               //             .bodyMedium
//                               //             .fontWeight,
//                               //         fontStyle: FlutterFlowTheme.of(context)
//                               //             .bodyMedium
//                               //             .fontStyle,
//                               //       ),
//                               // ),
//                               // // InkWell(
//                               //   splashColor: Colors.transparent,
//                               //   focusColor: Colors.transparent,
//                               //   hoverColor: Colors.transparent,
//                               //   highlightColor: Colors.transparent,
//                               //   onTap: () async {
//                               //     controller.scaffoldKey.currentState!.openEndDrawer();
//                               //   },
//                               //   child: Icon(
//                               //     Icons.menu,
//                               //     color: FlutterFlowTheme.of(context)
//                               //         .secondaryBackground,
//                               //     size: 34.0,
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                         ),
//                       if (responsiveVisibility(
//                         context: context,
//                         phone: false,
//                         tablet: false,
//                         tabletLandscape: false,
//                         desktop: false,
//                       ))
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(
//                               0.0, 30.0, 0.0, 0.0),
//                           child: StreamBuilder<List<CatagoriesRecord>>(
//                             stream: queryCatagoriesRecord(
//                               queryBuilder: (catagoriesRecord) =>
//                                   catagoriesRecord.orderBy('order'),
//                             ),
//                             builder: (context, snapshot) {
//                               if (!snapshot.hasData) {
//                                 // Lightweight placeholder while categories load
//                                 return const SizedBox.shrink();
//                               }
//                               List<CatagoriesRecord>
//                                   columnCatagoriesRecordList = snapshot.data!;

//                               return Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: List.generate(
//                                     columnCatagoriesRecordList.length,
//                                     (columnIndex) {
//                                   final columnCatagoriesRecord =
//                                       columnCatagoriesRecordList[columnIndex];
//                                   return Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         0.0, 15.0, 0.0, 0.0),
//                                     child: InkWell(
//                                       splashColor: Colors.transparent,
//                                       focusColor: Colors.transparent,
//                                       hoverColor: Colors.transparent,
//                                       highlightColor: Colors.transparent,
//                                       onTap: () async {
//                                         if (columnCatagoriesRecord == null)
//                                           return;
//                                         Get.toNamed(
//                                           EventsEntertainmentScreenCopyWidget
//                                               .routePath,
//                                           arguments: {
//                                             'catagories': columnCatagoriesRecord
//                                           },
//                                         );
//                                       },
//                                       child: Container(
//                                         width:
//                                             MediaQuery.sizeOf(context).width *
//                                                 0.8,
//                                         height: 40.0,
//                                         decoration: BoxDecoration(
//                                           color: FlutterFlowTheme.of(context)
//                                               .primaryBackground,
//                                           borderRadius:
//                                               BorderRadius.circular(8.0),
//                                           border: Border.all(
//                                             color: FlutterFlowTheme.of(context)
//                                                 .primary,
//                                           ),
//                                         ),
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.max,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Row(
//                                               mainAxisSize: MainAxisSize.max,
//                                               children: [
//                                                 Container(
//                                                   width: 20.0,
//                                                   height: 20.0,
//                                                   child: custom_widgets
//                                                       .SvgNetworkImage(
//                                                     width: 20.0,
//                                                     height: 20.0,
//                                                     url: columnCatagoriesRecord
//                                                         .image,
//                                                   ),
//                                                 ),
//                                                 Align(
//                                                   alignment:
//                                                       AlignmentDirectional(
//                                                           0.0, 0.0),
//                                                   child: Padding(
//                                                     padding:
//                                                         EdgeInsetsDirectional
//                                                             .fromSTEB(10.0, 0.0,
//                                                                 0.0, 0.0),
//                                                     child: Text(
//                                                       columnCatagoriesRecord
//                                                           .catagoryName
//                                                           .maybeHandleOverflow(
//                                                         maxChars: () {
//                                                           if (MediaQuery.sizeOf(
//                                                                       context)
//                                                                   .width <
//                                                               kBreakpointSmall) {
//                                                             return 100;
//                                                           } else if (MediaQuery
//                                                                       .sizeOf(
//                                                                           context)
//                                                                   .width <
//                                                               kBreakpointMedium) {
//                                                             return 100;
//                                                           } else if (MediaQuery
//                                                                       .sizeOf(
//                                                                           context)
//                                                                   .width <
//                                                               kBreakpointLarge) {
//                                                             return 100;
//                                                           } else {
//                                                             return 100;
//                                                           }
//                                                         }(),
//                                                         replacement: '…',
//                                                       ),
//                                                       style:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .bodyMedium
//                                                               .override(
//                                                                 font:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .normal,
//                                                                   fontStyle: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .bodyMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                                 color: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .primary,
//                                                                 fontSize: 14.0,
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .normal,
//                                                                 fontStyle: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .bodyMedium
//                                                                     .fontStyle,
//                                                               ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 }),
//                               ).animateOnPageLoad(
//                                   animationsMap['columnOnPageLoadAnimation']!);
//                             },
//                           ),
//                         ),
//                       Builder(
//                         builder: (context) {
//                           if (MediaQuery.sizeOf(context).width > 450.0) {
//                             return Padding(
//                               padding: EdgeInsetsDirectional.fromSTEB(
//                                   10.0, 40.0, 10.0, 0.0),
//                               child: StreamBuilder<List<CatagoriesRecord>>(
//                                 stream: queryCatagoriesRecord(
//                                   queryBuilder: (catagoriesRecord) =>
//                                       catagoriesRecord.orderBy('order'),
//                                 ),
//                                 builder: (context, snapshot) {
//                                   if (!snapshot.hasData) {
//                                     // Lightweight placeholder while categories load
//                                     return const SizedBox.shrink();
//                                   }
//                                   List<CatagoriesRecord>
//                                       gridViewCatagoriesRecordList =
//                                       snapshot.data!;

//                                   return GridView.builder(
//                                     padding: EdgeInsets.zero,
//                                     gridDelegate:
//                                         SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 6,
//                                       crossAxisSpacing: 10.0,
//                                       mainAxisSpacing: 10.0,
//                                       childAspectRatio: 1.0,
//                                     ),
//                                     primary: false,
//                                     shrinkWrap: true,
//                                     scrollDirection: Axis.vertical,
//                                     itemCount:
//                                         gridViewCatagoriesRecordList.length,
//                                     itemBuilder: (context, gridViewIndex) {
//                                       final gridViewCatagoriesRecord =
//                                           gridViewCatagoriesRecordList[
//                                               gridViewIndex];
//                                       return Stack(
//                                         children: [
//                                           ClipRect(
//                                             child: ImageFiltered(
//                                               imageFilter: ImageFilter.blur(
//                                                 sigmaX: 1.0,
//                                                 sigmaY: 1.0,
//                                               ),
//                                               child: InkWell(
//                                                 splashColor: Colors.transparent,
//                                                 focusColor: Colors.transparent,
//                                                 hoverColor: Colors.transparent,
//                                                 highlightColor:
//                                                     Colors.transparent,
//                                                 onTap: () async {
//                                                   if (gridViewCatagoriesRecord ==
//                                                       null) return;
//                                                   Get.toNamed(
//                                                     EventsEntertainmentScreenCopyWidget
//                                                         .routePath,
//                                                     arguments: {
//                                                       'catagories':
//                                                           gridViewCatagoriesRecord
//                                                     },
//                                                   );
//                                                 },
//                                                 child: Container(
//                                                   width: double.infinity,
//                                                   height: double.infinity,
//                                                   child: custom_widgets
//                                                       .SvgNetworkImage(
//                                                     width: double.infinity,
//                                                     height: double.infinity,
//                                                     url: valueOrDefault<String>(
//                                                       gridViewCatagoriesRecord
//                                                           .image,
//                                                       'https://images.pexels.com/photos/2747449/pexels-photo-2747449.jpeg?cs=srgb&dl=pexels-wolfgang-1002140-2747449.jpg&fm=jpg',
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Align(
//                                             alignment:
//                                                 AlignmentDirectional(0.0, 0.0),
//                                             child: Text(
//                                               gridViewCatagoriesRecord
//                                                   .catagoryName,
//                                               textAlign: TextAlign.center,
//                                               style: FlutterFlowTheme.of(
//                                                       context)
//                                                   .bodyMedium
//                                                   .override(
//                                                     font: GoogleFonts.inter(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .bodyMedium
//                                                               .fontStyle,
//                                                     ),
//                                                     color: FlutterFlowTheme.of(
//                                                             context)
//                                                         .inputColor,
//                                                     fontSize: 20.0,
//                                                     letterSpacing: 0.0,
//                                                     fontWeight: FontWeight.bold,
//                                                     fontStyle:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .bodyMedium
//                                                             .fontStyle,
//                                                   ),
//                                             ),
//                                           ),
//                                         ],
//                                       );
//                                     },
//                                   );
//                                 },
//                               ),
//                             );
//                           } else {
//                             return Padding(
//                               padding: EdgeInsetsDirectional.fromSTEB(
//                                   10.0, 40.0, 10.0, 0.0),
//                               child: StreamBuilder<List<CatagoriesRecord>>(
//                                 stream: queryCatagoriesRecord(
//                                   queryBuilder: (catagoriesRecord) =>
//                                       catagoriesRecord.orderBy('order'),
//                                 ),
//                                 builder: (context, snapshot) {
//                                   if (!snapshot.hasData) {
//                                     // Lightweight placeholder while categories load
//                                     return const SizedBox.shrink();
//                                   }
//                                   List<CatagoriesRecord>
//                                       gridViewCatagoriesRecordList =
//                                       snapshot.data!;

//                                   return GridView.builder(
//                                     padding: EdgeInsets.zero,
//                                     gridDelegate:
//                                         SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 2,
//                                       crossAxisSpacing: 10.0,
//                                       mainAxisSpacing: 10.0,
//                                       childAspectRatio: 1.4,
//                                     ),
//                                     primary: false,
//                                     shrinkWrap: true,
//                                     scrollDirection: Axis.vertical,
//                                     itemCount:
//                                         gridViewCatagoriesRecordList.length,
//                                     itemBuilder: (context, gridViewIndex) {
//                                       final gridViewCatagoriesRecord =
//                                           gridViewCatagoriesRecordList[
//                                               gridViewIndex];
//                                       return Stack(
//                                         children: [
//                                           ClipRect(
//                                             child: ImageFiltered(
//                                               imageFilter: ImageFilter.blur(
//                                                 sigmaX: 1.0,
//                                                 sigmaY: 1.0,
//                                               ),
//                                               child: InkWell(
//                                                 splashColor: Colors.transparent,
//                                                 focusColor: Colors.transparent,
//                                                 hoverColor: Colors.transparent,
//                                                 highlightColor:
//                                                     Colors.transparent,
//                                                 onTap: () async {
//                                                   if (gridViewCatagoriesRecord ==
//                                                       null) return;
//                                                   Get.toNamed(
//                                                     EventsEntertainmentScreenCopyWidget
//                                                         .routePath,
//                                                     arguments: {
//                                                       'catagories':
//                                                           gridViewCatagoriesRecord
//                                                     },
//                                                   );
//                                                 },
//                                                 child: Container(
//                                                   width: double.infinity,
//                                                   height: double.infinity,
//                                                   child: custom_widgets
//                                                       .SvgNetworkImage(
//                                                     width: double.infinity,
//                                                     height: double.infinity,
//                                                     url:
//                                                         gridViewCatagoriesRecord
//                                                             .image,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Align(
//                                             alignment:
//                                                 AlignmentDirectional(0.0, 0.0),
//                                             child: Text(
//                                               gridViewCatagoriesRecord
//                                                   .catagoryName,
//                                               textAlign: TextAlign.center,
//                                               style: FlutterFlowTheme.of(
//                                                       context)
//                                                   .bodyMedium
//                                                   .override(
//                                                     font: GoogleFonts.inter(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .bodyMedium
//                                                               .fontStyle,
//                                                     ),
//                                                     color: FlutterFlowTheme.of(
//                                                             context)
//                                                         .inputColor,
//                                                     fontSize: 20.0,
//                                                     letterSpacing: 0.0,
//                                                     fontWeight: FontWeight.bold,
//                                                     fontStyle:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .bodyMedium
//                                                             .fontStyle,
//                                                   ),
//                                             ),
//                                           ),
//                                         ],
//                                       );
//                                     },
//                                   );
//                                 },
//                               ),
//                             );
//                           }
//                         },
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(
//                             0.0, 100.0, 0.0, 0.0),
//                         child: StreamBuilder<List<BannerRecord>>(
//                           stream: queryBannerRecord(),
//                           builder: (context, snapshot) {
//                             if (!snapshot.hasData) {
//                               // Do not show a loader here; keep space reserved
//                               // so that when data arrives, it appears without animation.
//                               return const SizedBox.shrink();
//                             }
//                             return Container(
//                               width: double.infinity,
//                               height: 60.0,
//                               child: custom_widgets.ScrollableTextWidget(
//                                 width: double.infinity,
//                                 height: 60.0,
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Align(
//                         alignment: AlignmentDirectional(0.0, 0.0),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(
//                               10.0, 100.0, 0.0, 0.0),
//                           child: Text(
//                             'Contact',
//                             style: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .override(
//                                   font: GoogleFonts.inter(
//                                     fontWeight: FontWeight.normal,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .bodyMedium
//                                         .fontStyle,
//                                   ),
//                                   color: FlutterFlowTheme.of(context).textColor,
//                                   fontSize:
//                                       MediaQuery.sizeOf(context).width <= 450.0
//                                           ? 30.0
//                                           : 60.0,
//                                   letterSpacing: 0.0,
//                                   fontWeight: FontWeight.normal,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .bodyMedium
//                                       .fontStyle,
//                                 ),
//                           ),
//                         ),
//                       ),
//                       Builder(
//                         builder: (context) {
//                           if (MediaQuery.sizeOf(context).width >= 450.0) {
//                             return Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Form(
//                                   key: model.formKey2,
//                                   autovalidateMode: AutovalidateMode.disabled,
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.max,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Align(
//                                         alignment:
//                                             AlignmentDirectional(0.0, 0.0),
//                                         child: Container(
//                                           width:
//                                               MediaQuery.sizeOf(context).width *
//                                                   0.4,
//                                           decoration: BoxDecoration(),
//                                           child: Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     10.0, 200.0, 0.0, 40.0),
//                                             child: Text(
//                                               'If you have questions, concerns, or if you have Events or Businesses you would like added, please contact us here or by email and we will get to you shortly.',
//                                               textAlign: TextAlign.center,
//                                               style:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         font: GoogleFonts.inter(
//                                                           fontWeight:
//                                                               FontWeight.normal,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                         color:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .textColor,
//                                                         fontSize: 10.0,
//                                                         letterSpacing: 0.0,
//                                                         fontWeight:
//                                                             FontWeight.normal,
//                                                         fontStyle:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontStyle,
//                                                       ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0.0, 20.0, 0.0, 0.0),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Name *',
//                                               style:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         font: GoogleFonts.inter(
//                                                           fontWeight:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontWeight,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                         color:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .textColor,
//                                                         fontSize: 10.0,
//                                                         letterSpacing: 0.0,
//                                                         fontWeight:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontWeight,
//                                                         fontStyle:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontStyle,
//                                                       ),
//                                             ),
//                                             Container(
//                                               width: MediaQuery.sizeOf(context)
//                                                       .width *
//                                                   0.25,
//                                               child: Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(
//                                                         0.0, 10.0, 0.0, 0.0),
//                                                 child: Container(
//                                                   width: 200.0,
//                                                   child: TextFormField(
//                                                     controller:
//                                                         model.textController1,
//                                                     focusNode: model
//                                                         .textFieldFocusNode1,
//                                                     autofocus: false,
//                                                     obscureText: false,
//                                                     decoration: InputDecoration(
//                                                       isDense: true,
//                                                       labelStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .labelMedium
//                                                               .override(
//                                                                 font:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   fontWeight: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                                 fontWeight: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontWeight,
//                                                                 fontStyle: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontStyle,
//                                                               ),
//                                                       hintStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .labelMedium
//                                                               .override(
//                                                                 font:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   fontWeight: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                                 fontWeight: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontWeight,
//                                                                 fontStyle: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontStyle,
//                                                               ),
//                                                       enabledBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .secondaryBackground,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       focusedBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .secondaryBackground,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       errorBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .error,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       focusedErrorBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .error,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       filled: true,
//                                                     ),
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .bodyMedium
//                                                         .override(
//                                                           font:
//                                                               GoogleFonts.inter(
//                                                             fontWeight:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .bodyMedium
//                                                                     .fontWeight,
//                                                             fontStyle:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .bodyMedium
//                                                                     .fontStyle,
//                                                           ),
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .secondaryBackground,
//                                                           letterSpacing: 0.0,
//                                                           fontWeight:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontWeight,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                     cursorColor:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .primaryText,
//                                                     enableInteractiveSelection:
//                                                         true,
//                                                     validator: model
//                                                         .textController1Validator
//                                                         .asValidator(context),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0.0, 20.0, 0.0, 0.0),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Email address *',
//                                               style:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         font: GoogleFonts.inter(
//                                                           fontWeight:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontWeight,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                         color:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .textColor,
//                                                         fontSize: 10.0,
//                                                         letterSpacing: 0.0,
//                                                         fontWeight:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontWeight,
//                                                         fontStyle:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontStyle,
//                                                       ),
//                                             ),
//                                             Container(
//                                               width: MediaQuery.sizeOf(context)
//                                                       .width *
//                                                   0.25,
//                                               child: Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(
//                                                         0.0, 10.0, 0.0, 0.0),
//                                                 child: Container(
//                                                   width: 200.0,
//                                                   child: TextFormField(
//                                                     controller:
//                                                         model.textController2,
//                                                     focusNode: model
//                                                         .textFieldFocusNode2,
//                                                     autofocus: false,
//                                                     obscureText: false,
//                                                     decoration: InputDecoration(
//                                                       isDense: true,
//                                                       labelStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .labelMedium
//                                                               .override(
//                                                                 font:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   fontWeight: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                                 fontWeight: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontWeight,
//                                                                 fontStyle: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontStyle,
//                                                               ),
//                                                       hintStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .labelMedium
//                                                               .override(
//                                                                 font:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   fontWeight: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                                 fontWeight: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontWeight,
//                                                                 fontStyle: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontStyle,
//                                                               ),
//                                                       enabledBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .secondaryBackground,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       focusedBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .secondaryBackground,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       errorBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .error,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       focusedErrorBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .error,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       filled: true,
//                                                     ),
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .bodyMedium
//                                                         .override(
//                                                           font:
//                                                               GoogleFonts.inter(
//                                                             fontWeight:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .bodyMedium
//                                                                     .fontWeight,
//                                                             fontStyle:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .bodyMedium
//                                                                     .fontStyle,
//                                                           ),
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .secondaryBackground,
//                                                           letterSpacing: 0.0,
//                                                           fontWeight:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontWeight,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                     cursorColor:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .primaryText,
//                                                     enableInteractiveSelection:
//                                                         true,
//                                                     validator: model
//                                                         .textController2Validator
//                                                         .asValidator(context),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0.0, 20.0, 0.0, 0.0),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Message *',
//                                               style:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         font: GoogleFonts.inter(
//                                                           fontWeight:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontWeight,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                         color:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .textColor,
//                                                         fontSize: 10.0,
//                                                         letterSpacing: 0.0,
//                                                         fontWeight:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontWeight,
//                                                         fontStyle:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontStyle,
//                                                       ),
//                                             ),
//                                             Container(
//                                               width: MediaQuery.sizeOf(context)
//                                                       .width *
//                                                   0.25,
//                                               child: Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(
//                                                         0.0, 10.0, 0.0, 0.0),
//                                                 child: Container(
//                                                   width: 200.0,
//                                                   child: TextFormField(
//                                                     controller:
//                                                         model.textController3,
//                                                     focusNode: model
//                                                         .textFieldFocusNode3,
//                                                     autofocus: false,
//                                                     obscureText: false,
//                                                     decoration: InputDecoration(
//                                                       isDense: true,
//                                                       labelStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .labelMedium
//                                                               .override(
//                                                                 font:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   fontWeight: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                                 fontWeight: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontWeight,
//                                                                 fontStyle: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontStyle,
//                                                               ),
//                                                       hintStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .labelMedium
//                                                               .override(
//                                                                 font:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   fontWeight: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                                 fontWeight: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontWeight,
//                                                                 fontStyle: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontStyle,
//                                                               ),
//                                                       enabledBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .secondaryBackground,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       focusedBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .secondaryBackground,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       errorBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .error,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       focusedErrorBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .error,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       filled: true,
//                                                     ),
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .bodyMedium
//                                                         .override(
//                                                           font:
//                                                               GoogleFonts.inter(
//                                                             fontWeight:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .bodyMedium
//                                                                     .fontWeight,
//                                                             fontStyle:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .bodyMedium
//                                                                     .fontStyle,
//                                                           ),
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .secondaryBackground,
//                                                           letterSpacing: 0.0,
//                                                           fontWeight:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontWeight,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                     maxLines: 7,
//                                                     cursorColor:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .primaryText,
//                                                     enableInteractiveSelection:
//                                                         true,
//                                                     validator: model
//                                                         .textController3Validator
//                                                         .asValidator(context),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0.0, 20.0, 0.0, 0.0),
//                                         child: FFButtonWidget(
//                                           onPressed: () async {
//                                             if (model.formKey2.currentState ==
//                                                     null ||
//                                                 !model.formKey2.currentState!
//                                                     .validate()) {
//                                               return;
//                                             }

//                                             await ContactUsRecord.collection
//                                                 .doc()
//                                                 .set(createContactUsRecordData(
//                                                   name: model
//                                                       .textController1.text,
//                                                   email: model
//                                                       .textController2.text,
//                                                   message: model
//                                                       .textController3.text,
//                                                   timestamp:
//                                                       getCurrentTimestamp,
//                                                 ));
//                                             ScaffoldMessenger.of(context)
//                                                 .showSnackBar(
//                                               SnackBar(
//                                                 content: Text(
//                                                   'Submitted SuccessFully!',
//                                                   style: TextStyle(
//                                                     color: FlutterFlowTheme.of(
//                                                             context)
//                                                         .secondary,
//                                                   ),
//                                                 ),
//                                                 duration: Duration(
//                                                     milliseconds: 4000),
//                                                 backgroundColor:
//                                                     FlutterFlowTheme.of(context)
//                                                         .primary,
//                                               ),
//                                             );
//                                           },
//                                           text: 'Submit form',
//                                           options: FFButtonOptions(
//                                             width: MediaQuery.sizeOf(context)
//                                                     .width *
//                                                 0.1,
//                                             height: 40.0,
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     16.0, 0.0, 16.0, 0.0),
//                                             iconPadding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0.0, 0.0, 0.0, 0.0),
//                                             color: FlutterFlowTheme.of(context)
//                                                 .primary,
//                                             textStyle: FlutterFlowTheme.of(
//                                                     context)
//                                                 .titleSmall
//                                                 .override(
//                                                   font: GoogleFonts.interTight(
//                                                     fontWeight:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .titleSmall
//                                                             .fontWeight,
//                                                     fontStyle:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .titleSmall
//                                                             .fontStyle,
//                                                   ),
//                                                   color: Colors.white,
//                                                   letterSpacing: 0.0,
//                                                   fontWeight:
//                                                       FlutterFlowTheme.of(
//                                                               context)
//                                                           .titleSmall
//                                                           .fontWeight,
//                                                   fontStyle:
//                                                       FlutterFlowTheme.of(
//                                                               context)
//                                                           .titleSmall
//                                                           .fontStyle,
//                                                 ),
//                                             elevation: 0.0,
//                                             borderRadius:
//                                                 BorderRadius.circular(8.0),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       Icons.email,
//                                       color:
//                                           FlutterFlowTheme.of(context).primary,
//                                       size: 50.0,
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0.0, 20.0, 0.0, 0.0),
//                                       child: Text(
//                                         'Email',
//                                         style: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .override(
//                                               font: GoogleFonts.inter(
//                                                 fontWeight:
//                                                     FlutterFlowTheme.of(context)
//                                                         .bodyMedium
//                                                         .fontWeight,
//                                                 fontStyle:
//                                                     FlutterFlowTheme.of(context)
//                                                         .bodyMedium
//                                                         .fontStyle,
//                                               ),
//                                               color:
//                                                   FlutterFlowTheme.of(context)
//                                                       .textColor,
//                                               fontSize: 24.0,
//                                               letterSpacing: 0.0,
//                                               fontWeight:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodyMedium
//                                                       .fontWeight,
//                                               fontStyle:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodyMedium
//                                                       .fontStyle,
//                                             ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0.0, 20.0, 0.0, 0.0),
//                                       child: InkWell(
//                                         splashColor: Colors.transparent,
//                                         focusColor: Colors.transparent,
//                                         hoverColor: Colors.transparent,
//                                         highlightColor: Colors.transparent,
//                                         onTap: () async {
//                                           await launchURL(
//                                               'TheOwensboroApp@gmail.com');
//                                         },
//                                         child: Text(
//                                           'TheOwensboroApp@gmail.com',
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodyMedium
//                                               .override(
//                                                 font: GoogleFonts.inter(
//                                                   fontWeight:
//                                                       FlutterFlowTheme.of(
//                                                               context)
//                                                           .bodyMedium
//                                                           .fontWeight,
//                                                   fontStyle:
//                                                       FlutterFlowTheme.of(
//                                                               context)
//                                                           .bodyMedium
//                                                           .fontStyle,
//                                                 ),
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .primary,
//                                                 fontSize: 24.0,
//                                                 letterSpacing: 0.0,
//                                                 fontWeight:
//                                                     FlutterFlowTheme.of(context)
//                                                         .bodyMedium
//                                                         .fontWeight,
//                                                 fontStyle:
//                                                     FlutterFlowTheme.of(context)
//                                                         .bodyMedium
//                                                         .fontStyle,
//                                               ),
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0.0, 50.0, 0.0, 0.0),
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.max,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         children: [
//                                           Icon(
//                                             Icons.location_pin,
//                                             color: FlutterFlowTheme.of(context)
//                                                 .primary,
//                                             size: 50.0,
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0.0, 20.0, 0.0, 0.0),
//                                             child: InkWell(
//                                               splashColor: Colors.transparent,
//                                               focusColor: Colors.transparent,
//                                               hoverColor: Colors.transparent,
//                                               highlightColor:
//                                                   Colors.transparent,
//                                               onTap: () async {
//                                                 await launchUrl(Uri(
//                                                     scheme: 'mailto',
//                                                     path:
//                                                         'TheOwensboroApp@gmail.com',
//                                                     query: {
//                                                       'subject': 'Testing',
//                                                       'body': 'Testing',
//                                                     }
//                                                         .entries
//                                                         .map((MapEntry<String,
//                                                                     String>
//                                                                 e) =>
//                                                             '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
//                                                         .join('&')));
//                                               },
//                                               child: Text(
//                                                 'Owensboro, Kentucky, USA',
//                                                 style: FlutterFlowTheme.of(
//                                                         context)
//                                                     .bodyMedium
//                                                     .override(
//                                                       font: GoogleFonts.inter(
//                                                         fontWeight:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontWeight,
//                                                         fontStyle:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontStyle,
//                                                       ),
//                                                       color:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .primary,
//                                                       fontSize: 24.0,
//                                                       letterSpacing: 0.0,
//                                                       fontWeight:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .bodyMedium
//                                                               .fontWeight,
//                                                       fontStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .bodyMedium
//                                                               .fontStyle,
//                                                     ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             );
//                           } else {
//                             return Wrap(
//                               spacing: 0.0,
//                               runSpacing: 0.0,
//                               alignment: WrapAlignment.center,
//                               crossAxisAlignment: WrapCrossAlignment.start,
//                               direction: Axis.horizontal,
//                               runAlignment: WrapAlignment.start,
//                               verticalDirection: VerticalDirection.down,
//                               clipBehavior: Clip.none,
//                               children: [
//                                 Form(
//                                   key: model.formKey1,
//                                   autovalidateMode: AutovalidateMode.disabled,
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.max,
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             20.0, 20.0, 20.0, 40.0),
//                                         child: Text(
//                                           'If you have questions, concerns, or if you have Events or Businesses you would like added, please contact us here or by email and we will get to you shortly.',
//                                           textAlign: TextAlign.center,
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodyMedium
//                                               .override(
//                                                 font: GoogleFonts.inter(
//                                                   fontWeight: FontWeight.normal,
//                                                   fontStyle:
//                                                       FlutterFlowTheme.of(
//                                                               context)
//                                                           .bodyMedium
//                                                           .fontStyle,
//                                                 ),
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .textColor,
//                                                 fontSize: 20.0,
//                                                 letterSpacing: 0.0,
//                                                 fontWeight: FontWeight.normal,
//                                                 fontStyle:
//                                                     FlutterFlowTheme.of(context)
//                                                         .bodyMedium
//                                                         .fontStyle,
//                                               ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0.0, 20.0, 0.0, 0.0),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Name *',
//                                               style:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         font: GoogleFonts.inter(
//                                                           fontWeight:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontWeight,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                         color:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .textColor,
//                                                         fontSize: 24.0,
//                                                         letterSpacing: 0.0,
//                                                         fontWeight:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontWeight,
//                                                         fontStyle:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontStyle,
//                                                       ),
//                                             ),
//                                             Container(
//                                               width: MediaQuery.sizeOf(context)
//                                                       .width *
//                                                   0.8,
//                                               child: Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(
//                                                         0.0, 10.0, 0.0, 0.0),
//                                                 child: Container(
//                                                   width: 200.0,
//                                                   child: TextFormField(
//                                                     controller:
//                                                         model.textController4,
//                                                     focusNode: model
//                                                         .textFieldFocusNode4,
//                                                     autofocus: false,
//                                                     obscureText: false,
//                                                     decoration: InputDecoration(
//                                                       isDense: true,
//                                                       labelStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .labelMedium
//                                                               .override(
//                                                                 font:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   fontWeight: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                                 fontWeight: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontWeight,
//                                                                 fontStyle: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontStyle,
//                                                               ),
//                                                       hintStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .labelMedium
//                                                               .override(
//                                                                 font:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   fontWeight: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                                 fontWeight: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontWeight,
//                                                                 fontStyle: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontStyle,
//                                                               ),
//                                                       enabledBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .textColor,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       focusedBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .textColor,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       errorBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .error,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       focusedErrorBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .error,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       filled: true,
//                                                     ),
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .bodyMedium
//                                                         .override(
//                                                           font:
//                                                               GoogleFonts.inter(
//                                                             fontWeight:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .bodyMedium
//                                                                     .fontWeight,
//                                                             fontStyle:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .bodyMedium
//                                                                     .fontStyle,
//                                                           ),
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .secondaryBackground,
//                                                           letterSpacing: 0.0,
//                                                           fontWeight:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontWeight,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                     cursorColor:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .primaryText,
//                                                     enableInteractiveSelection:
//                                                         true,
//                                                     validator: model
//                                                         .textController4Validator
//                                                         .asValidator(context),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0.0, 20.0, 0.0, 0.0),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Email address *',
//                                               style:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         font: GoogleFonts.inter(
//                                                           fontWeight:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontWeight,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                         color:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .textColor,
//                                                         fontSize: 24.0,
//                                                         letterSpacing: 0.0,
//                                                         fontWeight:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontWeight,
//                                                         fontStyle:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontStyle,
//                                                       ),
//                                             ),
//                                             Container(
//                                               width: MediaQuery.sizeOf(context)
//                                                       .width *
//                                                   0.8,
//                                               child: Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(
//                                                         0.0, 10.0, 0.0, 0.0),
//                                                 child: Container(
//                                                   width: 200.0,
//                                                   child: TextFormField(
//                                                     controller:
//                                                         model.textController5,
//                                                     focusNode: model
//                                                         .textFieldFocusNode5,
//                                                     autofocus: false,
//                                                     obscureText: false,
//                                                     decoration: InputDecoration(
//                                                       isDense: true,
//                                                       labelStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .labelMedium
//                                                               .override(
//                                                                 font:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   fontWeight: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                                 fontWeight: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontWeight,
//                                                                 fontStyle: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontStyle,
//                                                               ),
//                                                       hintStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .labelMedium
//                                                               .override(
//                                                                 font:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   fontWeight: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                                 fontWeight: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontWeight,
//                                                                 fontStyle: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontStyle,
//                                                               ),
//                                                       enabledBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .textColor,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       focusedBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .textColor,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       errorBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .error,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       focusedErrorBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .error,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       filled: true,
//                                                     ),
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .bodyMedium
//                                                         .override(
//                                                           font:
//                                                               GoogleFonts.inter(
//                                                             fontWeight:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .bodyMedium
//                                                                     .fontWeight,
//                                                             fontStyle:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .bodyMedium
//                                                                     .fontStyle,
//                                                           ),
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .secondaryBackground,
//                                                           letterSpacing: 0.0,
//                                                           fontWeight:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontWeight,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                     cursorColor:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .primaryText,
//                                                     enableInteractiveSelection:
//                                                         true,
//                                                     validator: model
//                                                         .textController5Validator
//                                                         .asValidator(context),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0.0, 20.0, 0.0, 0.0),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Message *',
//                                               style:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         font: GoogleFonts.inter(
//                                                           fontWeight:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontWeight,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                         color:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .textColor,
//                                                         fontSize: 24.0,
//                                                         letterSpacing: 0.0,
//                                                         fontWeight:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontWeight,
//                                                         fontStyle:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontStyle,
//                                                       ),
//                                             ),
//                                             Container(
//                                               width: MediaQuery.sizeOf(context)
//                                                       .width *
//                                                   0.8,
//                                               child: Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(
//                                                         0.0, 10.0, 0.0, 0.0),
//                                                 child: Container(
//                                                   width: 200.0,
//                                                   child: TextFormField(
//                                                     controller:
//                                                         model.textController6,
//                                                     focusNode: model
//                                                         .textFieldFocusNode6,
//                                                     autofocus: false,
//                                                     obscureText: false,
//                                                     decoration: InputDecoration(
//                                                       isDense: true,
//                                                       labelStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .labelMedium
//                                                               .override(
//                                                                 font:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   fontWeight: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                                 fontWeight: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontWeight,
//                                                                 fontStyle: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontStyle,
//                                                               ),
//                                                       hintStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .labelMedium
//                                                               .override(
//                                                                 font:
//                                                                     GoogleFonts
//                                                                         .inter(
//                                                                   fontWeight: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .labelMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                                 fontWeight: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontWeight,
//                                                                 fontStyle: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .fontStyle,
//                                                               ),
//                                                       enabledBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .textColor,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       focusedBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .textColor,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       errorBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .error,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       focusedErrorBorder:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .error,
//                                                           width: 1.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                       ),
//                                                       filled: true,
//                                                     ),
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .bodyMedium
//                                                         .override(
//                                                           font:
//                                                               GoogleFonts.inter(
//                                                             fontWeight:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .bodyMedium
//                                                                     .fontWeight,
//                                                             fontStyle:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .bodyMedium
//                                                                     .fontStyle,
//                                                           ),
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .secondaryBackground,
//                                                           letterSpacing: 0.0,
//                                                           fontWeight:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontWeight,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                     maxLines: 7,
//                                                     cursorColor:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .primaryText,
//                                                     enableInteractiveSelection:
//                                                         true,
//                                                     validator: model
//                                                         .textController6Validator
//                                                         .asValidator(context),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0.0, 20.0, 0.0, 0.0),
//                                         child: FFButtonWidget(
//                                           onPressed: () async {
//                                             if (model.formKey1.currentState ==
//                                                     null ||
//                                                 !model.formKey1.currentState!
//                                                     .validate()) {
//                                               return;
//                                             }

//                                             await ContactUsRecord.collection
//                                                 .doc()
//                                                 .set(createContactUsRecordData(
//                                                   name: model
//                                                       .textController4.text,
//                                                   email: model
//                                                       .textController5.text,
//                                                   message: model
//                                                       .textController6.text,
//                                                   timestamp:
//                                                       getCurrentTimestamp,
//                                                 ));
//                                             ScaffoldMessenger.of(context)
//                                                 .showSnackBar(
//                                               SnackBar(
//                                                 content: Text(
//                                                   'Submitted SuccessFully!',
//                                                   style: TextStyle(
//                                                     color: FlutterFlowTheme.of(
//                                                             context)
//                                                         .secondary,
//                                                   ),
//                                                 ),
//                                                 duration: Duration(
//                                                     milliseconds: 4000),
//                                                 backgroundColor:
//                                                     FlutterFlowTheme.of(context)
//                                                         .primary,
//                                               ),
//                                             );
//                                           },
//                                           text: 'Submit form',
//                                           options: FFButtonOptions(
//                                             width: MediaQuery.sizeOf(context)
//                                                     .width *
//                                                 0.6,
//                                             height: 40.0,
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     16.0, 0.0, 16.0, 0.0),
//                                             iconPadding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0.0, 0.0, 0.0, 0.0),
//                                             color: FlutterFlowTheme.of(context)
//                                                 .primary,
//                                             textStyle: FlutterFlowTheme.of(
//                                                     context)
//                                                 .titleSmall
//                                                 .override(
//                                                   font: GoogleFonts.interTight(
//                                                     fontWeight:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .titleSmall
//                                                             .fontWeight,
//                                                     fontStyle:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .titleSmall
//                                                             .fontStyle,
//                                                   ),
//                                                   color: Colors.white,
//                                                   letterSpacing: 0.0,
//                                                   fontWeight:
//                                                       FlutterFlowTheme.of(
//                                                               context)
//                                                           .titleSmall
//                                                           .fontWeight,
//                                                   fontStyle:
//                                                       FlutterFlowTheme.of(
//                                                               context)
//                                                           .titleSmall
//                                                           .fontStyle,
//                                                 ),
//                                             elevation: 0.0,
//                                             borderRadius:
//                                                 BorderRadius.circular(8.0),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       0.0, 40.0, 0.0, 0.0),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.max,
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.email,
//                                         color: FlutterFlowTheme.of(context)
//                                             .primary,
//                                         size:
//                                             MediaQuery.sizeOf(context).width >=
//                                                     450.0
//                                                 ? 50.0
//                                                 : 25.0,
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0.0, 20.0, 0.0, 0.0),
//                                         child: Text(
//                                           'Email',
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodyMedium
//                                               .override(
//                                                 font: GoogleFonts.inter(
//                                                   fontWeight:
//                                                       FlutterFlowTheme.of(
//                                                               context)
//                                                           .bodyMedium
//                                                           .fontWeight,
//                                                   fontStyle:
//                                                       FlutterFlowTheme.of(
//                                                               context)
//                                                           .bodyMedium
//                                                           .fontStyle,
//                                                 ),
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .textColor,
//                                                 fontSize:
//                                                     MediaQuery.sizeOf(context)
//                                                                 .width >=
//                                                             450.0
//                                                         ? 24.0
//                                                         : 14.0,
//                                                 letterSpacing: 0.0,
//                                                 fontWeight:
//                                                     FlutterFlowTheme.of(context)
//                                                         .bodyMedium
//                                                         .fontWeight,
//                                                 fontStyle:
//                                                     FlutterFlowTheme.of(context)
//                                                         .bodyMedium
//                                                         .fontStyle,
//                                               ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0.0, 20.0, 0.0, 0.0),
//                                         child: InkWell(
//                                           splashColor: Colors.transparent,
//                                           focusColor: Colors.transparent,
//                                           hoverColor: Colors.transparent,
//                                           highlightColor: Colors.transparent,
//                                           onTap: () async {
//                                             await launchURL(
//                                                 'TheOwensboroApp@gmail.com');
//                                           },
//                                           child: Text(
//                                             'TheOwensboroApp@gmail.com',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium
//                                                 .override(
//                                                   font: GoogleFonts.inter(
//                                                     fontWeight:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .bodyMedium
//                                                             .fontWeight,
//                                                     fontStyle:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .bodyMedium
//                                                             .fontStyle,
//                                                   ),
//                                                   color: FlutterFlowTheme.of(
//                                                           context)
//                                                       .primary,
//                                                   fontSize:
//                                                       MediaQuery.sizeOf(context)
//                                                                   .width >=
//                                                               450.0
//                                                           ? 24.0
//                                                           : 14.0,
//                                                   letterSpacing: 0.0,
//                                                   fontWeight:
//                                                       FlutterFlowTheme.of(
//                                                               context)
//                                                           .bodyMedium
//                                                           .fontWeight,
//                                                   fontStyle:
//                                                       FlutterFlowTheme.of(
//                                                               context)
//                                                           .bodyMedium
//                                                           .fontStyle,
//                                                 ),
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0.0, 50.0, 0.0, 0.0),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.max,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             Icon(
//                                               Icons.location_pin,
//                                               color:
//                                                   FlutterFlowTheme.of(context)
//                                                       .primary,
//                                               size: MediaQuery.sizeOf(context)
//                                                           .width >=
//                                                       450.0
//                                                   ? 50.0
//                                                   : 25.0,
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(
//                                                       0.0, 20.0, 0.0, 100.0),
//                                               child: InkWell(
//                                                 splashColor: Colors.transparent,
//                                                 focusColor: Colors.transparent,
//                                                 hoverColor: Colors.transparent,
//                                                 highlightColor:
//                                                     Colors.transparent,
//                                                 onTap: () async {
//                                                   await launchUrl(Uri(
//                                                       scheme: 'mailto',
//                                                       path:
//                                                           'TheOwensboroApp@gmail.com',
//                                                       query: {
//                                                         'subject': 'Testing',
//                                                         'body': 'Testing',
//                                                       }
//                                                           .entries
//                                                           .map((MapEntry<String,
//                                                                       String>
//                                                                   e) =>
//                                                               '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
//                                                           .join('&')));
//                                                 },
//                                                 child: Text(
//                                                   'Owensboro, Kentucky, USA',
//                                                   style: FlutterFlowTheme.of(
//                                                           context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         font: GoogleFonts.inter(
//                                                           fontWeight:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontWeight,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                         color:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .primary,
//                                                         fontSize: MediaQuery.sizeOf(
//                                                                         context)
//                                                                     .width >=
//                                                                 450.0
//                                                             ? 24.0
//                                                             : 14.0,
//                                                         letterSpacing: 0.0,
//                                                         fontWeight:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontWeight,
//                                                         fontStyle:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontStyle,
//                                                       ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             );
//                           }
//                         },
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(20.0),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(
//                               padding: EdgeInsetsDirectional.fromSTEB(
//                                   0.0, 0.0, 0.0, 100.0),
//                               child: Text(
//                                 '© 2025 The Owensboro App',
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       font: GoogleFonts.inter(
//                                         fontWeight: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontWeight,
//                                         fontStyle: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontStyle,
//                                       ),
//                                       color: FlutterFlowTheme.of(context)
//                                           .textColor,
//                                       fontSize:
//                                           MediaQuery.sizeOf(context).width >=
//                                                   450.0
//                                               ? 14.0
//                                               : 10.0,
//                                       letterSpacing: 0.0,
//                                       fontWeight: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontWeight,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontStyle,
//                                     ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ]),
//           ),
//         ));
//   }
// }

// class _BannerHeaderDelegate extends SliverPersistentHeaderDelegate {
//   _BannerHeaderDelegate({
//     required this.child,
//     this.height = 60.0,
//   });

//   final Widget child;
//   final double height;

//   @override
//   double get minExtent => height;

//   @override
//   double get maxExtent => height;

//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     return SizedBox.expand(
//       child: Material(
//         color: Colors.transparent,
//         child: child,
//       ),
//     );
//   }

//   @override
//   bool shouldRebuild(covariant _BannerHeaderDelegate oldDelegate) {
//     return oldDelegate.child != child || oldDelegate.height != height;
//   }
// }
import 'package:get/get.dart';
import 'package:the_owensboro_app/widgets/app_end_drawer.dart';

import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/alert_login_sign_up_widget.dart';
import '/components/delete_user_alert_widget.dart';
import '/components/logout_alert_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import '/pages/main_bottom_nav/main_bottom_nav_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'controller/home_page_dynamic_controller.dart';
import 'home_page_dynamic_model.dart';
export 'home_page_dynamic_model.dart';

class HomePageDynamicWidget extends StatefulWidget {
  const HomePageDynamicWidget({super.key});

  static String routeName = 'HomePageDynamic';
  static String routePath = '/homePageDynamic';

  @override
  State<HomePageDynamicWidget> createState() => _HomePageDynamicWidgetState();
}

class _HomePageDynamicWidgetState extends State<HomePageDynamicWidget> with TickerProviderStateMixin {
  late HomePageDynamicController _controller;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _controller = Get.find<HomePageDynamicController>();
    _controller.initModel(context);
    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 640.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageDynamicController>(
      builder: (controller) {
        final model = controller.model!;
        return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        //                   if (controller.scaffoldKey.currentState!.isDrawerOpen ||
        //                       controller.scaffoldKey.currentState!.isEndDrawerOpen) {
        //                     Navigator.pop(context);
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
        //                 model.selectedTab = 'HOME';
        //                 controller.notifyUi();

        //                 context.pushNamed(HomePageDynamicWidget.routeName);
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
        //                       color: model.selectedTab == 'HOME'
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
        //                   model.selectedTab = 'Wheel of Adventure';
        //                   controller.notifyUi();
        //                   if (loggedIn) {
        //                     context.pushNamed(
        //                         WheelAdventureScreenWidget.routeName);

        //                     if (controller.scaffoldKey.currentState!.isDrawerOpen ||
        //                         controller.scaffoldKey.currentState!.isEndDrawerOpen) {
        //                       Navigator.pop(context);
        //                     }

        //                     model.selectedTab = '.';
        //                     controller.notifyUi();
        //                     return;
        //                   } else {
        //                     await showDialog(
        //                       context: context,
        //                       builder: (dialogContext) {
        //                         return Dialog(
        //                           elevation: 0,
        //                           insetPadding: EdgeInsets.zero,
        //                           backgroundColor: Colors.transparent,
        //                           alignment: AlignmentDirectional(0.0, 0.0)
        //                               .resolve(Directionality.of(context)),
        //                           child: GestureDetector(
        //                             onTap: () {
        //                               FocusScope.of(dialogContext).unfocus();
        //                               FocusManager.instance.primaryFocus
        //                                   ?.unfocus();
        //                             },
        //                             child: Container(
        //                               height:
        //                                   MediaQuery.sizeOf(context).height *
        //                                       0.3,
        //                               width: MediaQuery.sizeOf(context).width *
        //                                   0.35,
        //                               child: AlertLoginSignUpWidget(),
        //                             ),
        //                           ),
        //                         );
        //                       },
        //                     );

        //                     return;
        //                   }
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
        //                             model.selectedTab == 'Wheel of Adventure'
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
        //                 model.selectedTab = 'CUSTOMER SERVICES';
        //                 controller.notifyUi();

        //                 context.pushNamed(ContactUsWidget.routeName);
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
        //                       color: model.selectedTab == 'CUSTOMER SERVICES'
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
        //                           context.pushNamed(
        //                               UserSideSignUpScreenWidget.routeName);
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
        //                               color: model.selectedTab ==
        //                                       'CUSTOMER SERVICES'
        //                                   ? FlutterFlowTheme.of(context).error
        //                                   : FlutterFlowTheme.of(context).error,
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
        //                           context.pushNamed(
        //                               UserSideLoginScreenWidget.routeName);
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
        //           Spacer(),
        //           Padding(
        //             padding:
        //                 EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
        //             child: Row(
        //               mainAxisSize: MainAxisSize.max,
        //               children: [
        //                 Padding(
        //                   padding: EdgeInsetsDirectional.fromSTEB(
        //                       20.0, 0.0, 0.0, 0.0),
        //                   child: InkWell(
        //                     splashColor: Colors.transparent,
        //                     focusColor: Colors.transparent,
        //                     hoverColor: Colors.transparent,
        //                     highlightColor: Colors.transparent,
        //                     onTap: () async {
        //                       context.pushNamed(PrivacyPageWidget.routeName);
        //                     },
        //                     child: Text(
        //                       'PRIVACY POLICY',
        //                       style: FlutterFlowTheme.of(context)
        //                           .bodyMedium
        //                           .override(
        //                             font: GoogleFonts.inter(
        //                               fontWeight: FontWeight.w600,
        //                               fontStyle: FlutterFlowTheme.of(context)
        //                                   .bodyMedium
        //                                   .fontStyle,
        //                             ),
        //                             color: model.selectedTab ==
        //                                     'CUSTOMER SERVICES'
        //                                 ? FlutterFlowTheme.of(context).primary
        //                                 : FlutterFlowTheme.of(context)
        //                                     .secondaryBackground,
        //                             fontSize: 10.0,
        //                             letterSpacing: 0.0,
        //                             fontWeight: FontWeight.w600,
        //                             fontStyle: FlutterFlowTheme.of(context)
        //                                 .bodyMedium
        //                                 .fontStyle,
        //                           ),
        //                     ),
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 10.0,
        //                   child: VerticalDivider(
        //                     thickness: 2.0,
        //                     color: FlutterFlowTheme.of(context).alternate,
        //                   ),
        //                 ),
        //                 Align(
        //                   alignment: AlignmentDirectional(-1.0, 1.0),
        //                   child: InkWell(
        //                     splashColor: Colors.transparent,
        //                     focusColor: Colors.transparent,
        //                     hoverColor: Colors.transparent,
        //                     highlightColor: Colors.transparent,
        //                     onTap: () async {
        //                       context
        //                           .pushNamed(TermConditionPageWidget.routeName);
        //                     },
        //                     child: Text(
        //                       'TERMS & CONDITION',
        //                       style: FlutterFlowTheme.of(context)
        //                           .bodyMedium
        //                           .override(
        //                             font: GoogleFonts.inter(
        //                               fontWeight: FontWeight.w600,
        //                               fontStyle: FlutterFlowTheme.of(context)
        //                                   .bodyMedium
        //                                   .fontStyle,
        //                             ),
        //                             color: model.selectedTab ==
        //                                     'CUSTOMER SERVICES'
        //                                 ? FlutterFlowTheme.of(context).primary
        //                                 : FlutterFlowTheme.of(context)
        //                                     .secondaryBackground,
        //                             fontSize: 10.0,
        //                             letterSpacing: 0.0,
        //                             fontWeight: FontWeight.w600,
        //                             fontStyle: FlutterFlowTheme.of(context)
        //                                 .bodyMedium
        //                                 .fontStyle,
        //                           ),
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),

        endDrawer: AppEndDrawer(
          scaffoldKey: controller.scaffoldKey,
          selectedTab: model.selectedTab,
          onSelectedTabChanged: (value) {
            model.selectedTab = value;
            controller.notifyUi();
          },
        ),
        appBar: MediaQuery.sizeOf(context).width >= 450.0
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
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
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                actions: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            model.isSelected = true;
                            model.selectedTab = 'HOME';
                            controller.notifyUi();

                            Get.offAllNamed(
                              MainBottomNavWidget.routePath,
                              arguments: <String, dynamic>{'tabIndex': 0},
                            );
                          },
                          child: Container(
                            width: 100.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: model.selectedTab == 'HOME'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                              ),
                            ),
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
                              model.isSelected = true;
                              model.selectedTab = 'Wheel of Adventure';
                              controller.notifyUi();
                              if (loggedIn) {
                                Get.toNamed(
                                    WheelAdventureScreenWidget.routePath);

                                return;
                              } else {
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
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
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

                                return;
                              }
                            },
                            child: Container(
                              width: 200.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: model.selectedTab == 'VOTING'
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                ),
                              ),
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
                            model.isSelected = true;
                            model.selectedTab = 'CUSTOMER SERVICE';
                            controller.notifyUi();

                            Get.offAllNamed(
                              MainBottomNavWidget.routePath,
                              arguments: <String, dynamic>{'tabIndex': 3},
                            );
                          },
                          child: Container(
                            width: 200.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: model.selectedTab == 'CUSTOMER SERVICE'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                              ),
                            ),
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
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Get.toNamed(PrivacyPageWidget.routePath);
                          },
                          child: Container(
                            width: 180.0,
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Text(
                                  'PRIVACY POLICY',
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
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context
                                .pushNamed(TermConditionPageWidget.routeName);
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
                                  'TERMS & CONDITION',
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
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth(HomePageDynamicWidget.routeName,
                                context.mounted);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 220.0, 0.0, 10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'The Owensboro App',
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
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    controller.scaffoldKey.currentState!.openEndDrawer();
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 34.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: StreamBuilder<List<CatagoriesRecord>>(
                              stream: queryCatagoriesRecord(
                                queryBuilder: (catagoriesRecord) =>
                                    catagoriesRecord.orderBy('order'),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<CatagoriesRecord>
                                    columnCatagoriesRecordList = snapshot.data!;

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      columnCatagoriesRecordList.length,
                                      (columnIndex) {
                                    final columnCatagoriesRecord =
                                        columnCatagoriesRecordList[columnIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          Get.toNamed(
                                            EventsEntertainmentScreenCopyWidget
                                                .routePath,
                                            arguments: <String, dynamic>{
                                              'catagories':
                                                  columnCatagoriesRecord,
                                            },
                                          );
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.8,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 20.0,
                                                    height: 20.0,
                                                    child: custom_widgets
                                                        .SvgNetworkImage(
                                                      width: 20.0,
                                                      height: 20.0,
                                                      url:
                                                          columnCatagoriesRecord
                                                              .image,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        columnCatagoriesRecord
                                                            .catagoryName
                                                            .maybeHandleOverflow(
                                                          maxChars: () {
                                                            if (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                kBreakpointSmall) {
                                                              return 100;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointMedium) {
                                                              return 100;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointLarge) {
                                                              return 100;
                                                            } else {
                                                              return 100;
                                                            }
                                                          }(),
                                                          replacement: '…',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ).animateOnPageLoad(animationsMap[
                                    'columnOnPageLoadAnimation']!);
                              },
                            ),
                          ),
                        Builder(
                          builder: (context) {
                            if (MediaQuery.sizeOf(context).width > 450.0) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 40.0, 10.0, 0.0),
                                child: StreamBuilder<List<CatagoriesRecord>>(
                                  stream: queryCatagoriesRecord(
                                    queryBuilder: (catagoriesRecord) =>
                                        catagoriesRecord.orderBy('order'),
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
                                    List<CatagoriesRecord>
                                        gridViewCatagoriesRecordList =
                                        snapshot.data!;

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 6,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          gridViewCatagoriesRecordList.length,
                                      itemBuilder: (context, gridViewIndex) {
                                        final gridViewCatagoriesRecord =
                                            gridViewCatagoriesRecordList[
                                                gridViewIndex];
                                        return Stack(
                                          children: [
                                            ClipRect(
                                              child: ImageFiltered(
                                                imageFilter: ImageFilter.blur(
                                                  sigmaX: 1.0,
                                                  sigmaY: 1.0,
                                                ),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    Get.toNamed(
                                                      EventsEntertainmentScreenCopyWidget
                                                          .routePath,
                                                      arguments:
                                                          <String, dynamic>{
                                                        'catagories':
                                                            gridViewCatagoriesRecord,
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    child: custom_widgets
                                                        .SvgNetworkImage(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      url: valueOrDefault<
                                                          String>(
                                                        gridViewCatagoriesRecord
                                                            .image,
                                                        'https://images.pexels.com/photos/2747449/pexels-photo-2747449.jpeg?cs=srgb&dl=pexels-wolfgang-1002140-2747449.jpg&fm=jpg',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IgnorePointer(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                gridViewCatagoriesRecord
                                                    .catagoryName,
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .inputColor,
                                                      fontSize: 20.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 40.0, 10.0, 0.0),
                                child: StreamBuilder<List<CatagoriesRecord>>(
                                  stream: queryCatagoriesRecord(
                                    queryBuilder: (catagoriesRecord) =>
                                        catagoriesRecord.orderBy('order'),
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
                                    List<CatagoriesRecord>
                                        gridViewCatagoriesRecordList =
                                        snapshot.data!;

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 1.4,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          gridViewCatagoriesRecordList.length,
                                      itemBuilder: (context, gridViewIndex) {
                                        final gridViewCatagoriesRecord =
                                            gridViewCatagoriesRecordList[
                                                gridViewIndex];
                                        return Stack(
                                          children: [
                                            ClipRect(
                                              child: ImageFiltered(
                                                imageFilter: ImageFilter.blur(
                                                  sigmaX: 1.0,
                                                  sigmaY: 1.0,
                                                ),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    Get.toNamed(
                                                      EventsEntertainmentScreenCopyWidget
                                                          .routePath,
                                                      arguments:
                                                          <String, dynamic>{
                                                        'catagories':
                                                            gridViewCatagoriesRecord,
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    child: custom_widgets
                                                        .SvgNetworkImage(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      url:
                                                          gridViewCatagoriesRecord
                                                              .image,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IgnorePointer(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                gridViewCatagoriesRecord
                                                    .catagoryName,
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .inputColor,
                                                      fontSize: 20.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            }
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 100.0, 0.0, 0.0),
                          child: StreamBuilder<List<BannerRecord>>(
                            stream: queryBannerRecord(),
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
                              List<BannerRecord>
                                  scrollableTextWidgetBannerRecordList =
                                  snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: 60.0,
                                child: custom_widgets.ScrollableTextWidget(
                                  width: double.infinity,
                                  height: 60.0,
                                ),
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 100.0, 0.0, 0.0),
                            child: Text(
                              'Contact',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
                                    fontSize:
                                        MediaQuery.sizeOf(context).width <=
                                                450.0
                                            ? 24.0
                                            : 40.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            if (MediaQuery.sizeOf(context).width >= 450.0) {
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Form(
                                    key: model.formKey2,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.4,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 200.0, 0.0, 40.0),
                                              child: Text(
                                                'If you have questions, concerns, or if you have Events or Businesses you would like added, please contact us here or by email and we will get to you shortly.',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 5.0),

                                                // style: FlutterFlowTheme.of(
                                                //         context)
                                                //     .bodyMedium
                                                //     .override(
                                                //       font: GoogleFonts.inter(
                                                //         fontWeight:
                                                //             FontWeight.normal,
                                                //         fontStyle:
                                                //             FlutterFlowTheme.of(
                                                //                     context)
                                                //                 .bodyMedium
                                                //                 .fontStyle,
                                                //       ),
                                                //       color:
                                                //           FlutterFlowTheme.of(
                                                //                   context)
                                                //               .textColor,
                                                //       fontSize: 10.0,
                                                //       letterSpacing: 0.0,
                                                //       fontWeight:
                                                //           FontWeight.normal,
                                                //       fontStyle:
                                                //           FlutterFlowTheme.of(
                                                //                   context)
                                                //               .bodyMedium
                                                //               .fontStyle,
                                                //     ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox.shrink(),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.25,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 200.0,
                                                    child: TextFormField(
                                                      controller: model
                                                          .textController1,
                                                      focusNode: model
                                                          .textFieldFocusNode1,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelText: 'Name *',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      enableInteractiveSelection:
                                                          true,
                                                      validator: model
                                                          .textController1Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox.shrink(),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.25,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 200.0,
                                                    child: TextFormField(
                                                      controller: model
                                                          .textController2,
                                                      focusNode: model
                                                          .textFieldFocusNode2,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelText:
                                                            'Email address *',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      enableInteractiveSelection:
                                                          true,
                                                      validator: model
                                                          .textController2Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox.shrink(),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.25,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 200.0,
                                                    child: TextFormField(
                                                      controller: model
                                                          .textController3,
                                                      focusNode: model
                                                          .textFieldFocusNode3,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelText: 'Message *',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      maxLines: 7,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      enableInteractiveSelection:
                                                          true,
                                                      validator: model
                                                          .textController3Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (model.formKey2
                                                          .currentState ==
                                                      null ||
                                                  !model.formKey2.currentState!
                                                      .validate()) {
                                                return;
                                              }

                                              await ContactUsRecord.collection
                                                  .doc()
                                                  .set(
                                                      createContactUsRecordData(
                                                    name: model
                                                        .textController1.text,
                                                    email: model
                                                        .textController2.text,
                                                    message: model
                                                        .textController3.text,
                                                    timestamp:
                                                        getCurrentTimestamp,
                                                  ));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Submitted SuccessFully!',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                              );
                                            },
                                            text: 'Submit form',
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.1,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.email,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Text(
                                          'Email',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textColor,
                                                fontSize: 24.0,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await launchURL(
                                                'TheOwensboroApp@gmail.com');
                                          },
                                          child: Text(
                                            'TheOwensboroApp@gmail.com',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 50.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.location_pin,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await launchUrl(Uri(
                                                      scheme: 'mailto',
                                                      path:
                                                          'TheOwensboroApp@gmail.com',
                                                      query: {
                                                        'subject': 'Testing',
                                                        'body': 'Testing',
                                                      }
                                                          .entries
                                                          .map((MapEntry<String,
                                                                      String>
                                                                  e) =>
                                                              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                          .join('&')));
                                                },
                                                child: Text(
                                                  'Owensboro, Kentucky, USA',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            } else {
                              return Wrap(
                                spacing: 0.0,
                                runSpacing: 0.0,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  Form(
                                    key: model.formKey1,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 20.0, 40.0),
                                          child: Text(
                                            'If you have questions, concerns, or if you have Events or Businesses you would like added, please contact us here or by email and we will get to you shortly.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .textColor,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox.shrink(),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.8,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 200.0,
                                                    child: TextFormField(
                                                      controller: model
                                                          .textController4,
                                                      focusNode: model
                                                          .textFieldFocusNode4,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelText: 'Name *',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .textColor,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .textColor,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      enableInteractiveSelection:
                                                          true,
                                                      validator: model
                                                          .textController4Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox.shrink(),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.8,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 200.0,
                                                    child: TextFormField(
                                                      controller: model
                                                          .textController5,
                                                      focusNode: model
                                                          .textFieldFocusNode5,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelText:
                                                            'Email address *',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .textColor,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .textColor,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      enableInteractiveSelection:
                                                          true,
                                                      validator: model
                                                          .textController5Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox.shrink(),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.8,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 200.0,
                                                    child: TextFormField(
                                                      controller: model
                                                          .textController6,
                                                      focusNode: model
                                                          .textFieldFocusNode6,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelText: 'Message *',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .textColor,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .textColor,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      maxLines: 7,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      enableInteractiveSelection:
                                                          true,
                                                      validator: model
                                                          .textController6Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (model.formKey1
                                                          .currentState ==
                                                      null ||
                                                  !model.formKey1.currentState!
                                                      .validate()) {
                                                return;
                                              }

                                              await ContactUsRecord.collection
                                                  .doc()
                                                  .set(
                                                      createContactUsRecordData(
                                                    name: model
                                                        .textController4.text,
                                                    email: model
                                                        .textController5.text,
                                                    message: model
                                                        .textController6.text,
                                                    timestamp:
                                                        getCurrentTimestamp,
                                                  ));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Submitted SuccessFully!',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                              );
                                            },
                                            text: 'Submit form',
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.6,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 40.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.email,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: MediaQuery.sizeOf(context)
                                                      .width >=
                                                  450.0
                                              ? 50.0
                                              : 25.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Text(
                                            'Email',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .textColor,
                                                  fontSize:
                                                      MediaQuery.sizeOf(context)
                                                                  .width >=
                                                              450.0
                                                          ? 24.0
                                                          : 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await launchURL(
                                                  'TheOwensboroApp@gmail.com');
                                            },
                                            child: Text(
                                              'TheOwensboroApp@gmail.com',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: MediaQuery.sizeOf(
                                                                        context)
                                                                    .width >=
                                                                450.0
                                                            ? 24.0
                                                            : 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 50.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.location_pin,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: MediaQuery.sizeOf(context)
                                                            .width >=
                                                        450.0
                                                    ? 50.0
                                                    : 25.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 100.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await launchUrl(Uri(
                                                        scheme: 'mailto',
                                                        path:
                                                            'TheOwensboroApp@gmail.com',
                                                        query: {
                                                          'subject': 'Testing',
                                                          'body': 'Testing',
                                                        }
                                                            .entries
                                                            .map((MapEntry<
                                                                        String,
                                                                        String>
                                                                    e) =>
                                                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                            .join('&')));
                                                  },
                                                  child: Text(
                                                    'Owensboro, Kentucky, USA',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: MediaQuery.sizeOf(
                                                                          context)
                                                                      .width >=
                                                                  450.0
                                                              ? 24.0
                                                              : 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 100.0),
                                child: Text(
                                  '© 2025 The Owensboro App',
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
                                        fontSize:
                                            MediaQuery.sizeOf(context).width >=
                                                    450.0
                                                ? 14.0
                                                : 10.0,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hello ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Screenshot_2026-01-29_at_2.36.22_PM.png',
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              controller.scaffoldKey.currentState!.openEndDrawer();
                            },
                            child: Icon(
                              Icons.menu,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 34.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  Container(
                    width: double.infinity,
                    height: 160.0,
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          child: CarouselSlider(
                            items: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/dji_fly_20240828_105236_25_1724872752150_photo.jpg',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/dji_fly_20240828_105236_25_1724872752150_photo.jpg',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/dji_fly_20240828_105236_25_1724872752150_photo.jpg',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                            carouselController: model.carouselController ??=
                                CarouselSliderController(),
                            options: CarouselOptions(
                              initialPage: 1,
                              viewportFraction: 1.0,
                              disableCenter: true,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.25,
                              enableInfiniteScroll: true,
                              scrollDirection: Axis.horizontal,
                              autoPlay: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayInterval:
                                  Duration(milliseconds: (800 + 4000)),
                              autoPlayCurve: Curves.linear,
                              pauseAutoPlayInFiniteScroll: true,
                              onPageChanged: (index, _) =>
                                  model.carouselCurrentIndex = index,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width >= 450.0
                                          ? 370.0
                                          : 250.0,
                                  height: 50.0,
                                  child: custom_widgets.SearchWidget(
                                    width: MediaQuery.sizeOf(context).width >=
                                            450.0
                                        ? 370.0
                                        : 250.0,
                                    height: 50.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<List<BannerRecord>>(
                    stream: queryBannerRecord(),
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
                      List<BannerRecord> scrollableTextWidgetBannerRecordList =
                          snapshot.data!;

                      return Container(
                        width: double.infinity,
                        height: 60.0,
                        child: custom_widgets.ScrollableTextWidget(
                          width: double.infinity,
                          height: 60.0,
                        ),
                      );
                    },
                  ),
                ],
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

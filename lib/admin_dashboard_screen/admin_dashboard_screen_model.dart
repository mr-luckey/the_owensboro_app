import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_banner_widget.dart';
import '/components/add_catagory_alert_copy_widget.dart';
import '/components/add_catagory_alert_widget.dart';
import '/components/add_listing_alert_widget.dart';
import '/components/add_sub_catagory_alert_widget.dart';
import '/components/check_vote_widget.dart';
import '/components/delete_banner_widget.dart';
import '/components/delete_catagory_widget.dart';
import '/components/delete_listing_widget.dart';
import '/components/delete_sub_catagory_widget.dart';
import '/components/delete_voting_widget.dart';
import '/components/edit_banner_alert_widget.dart';
import '/components/edit_catagory_alert_widget.dart';
import '/components/edit_listing_alert_widget.dart';
import '/components/edit_sub_catagory_alert_widget.dart';
import '/components/edit_voting_widget.dart';
import '/components/view_message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'admin_dashboard_screen_widget.dart' show AdminDashboardScreenWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminDashboardScreenModel
    extends FlutterFlowModel<AdminDashboardScreenWidget> {
  ///  Local state fields for this page.

  String? selectedTab = 'Dashboard';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}

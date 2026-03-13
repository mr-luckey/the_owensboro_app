import '/auth/base_auth_user_provider.dart';
import '/components/alert_login_sign_up_widget.dart';
import '/components/delete_user_alert_widget.dart';
import '/components/logout_alert_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'privacy_page_widget.dart' show PrivacyPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PrivacyPageModel extends FlutterFlowModel<PrivacyPageWidget> {
  ///  Local state fields for this page.

  String? selectedTab = 'selectedTab';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

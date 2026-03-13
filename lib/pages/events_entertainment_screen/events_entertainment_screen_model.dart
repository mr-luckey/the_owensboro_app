import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/components/alert_login_sign_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'events_entertainment_screen_widget.dart'
    show EventsEntertainmentScreenWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventsEntertainmentScreenModel
    extends FlutterFlowModel<EventsEntertainmentScreenWidget> {
  ///  Local state fields for this page.

  bool? isSelected;

  String? selectedTab = 'selectedTab';

  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

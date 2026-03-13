import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'home_page_with_data_widget.dart' show HomePageWithDataWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageWithDataModel extends FlutterFlowModel<HomePageWithDataWidget> {
  ///  Local state fields for this page.

  bool? isSelected;

  String? selectedTab = 'selectedTab';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

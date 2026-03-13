import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'edit_listing_alert_widget.dart' show EditListingAlertWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditListingAlertModel extends FlutterFlowModel<EditListingAlertWidget> {
  ///  Local state fields for this component.

  String? startTime = 'N/A';

  String? endTime = 'N/A';

  String image = '';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for shortDescription widget.
  FocusNode? shortDescriptionFocusNode;
  TextEditingController? shortDescriptionTextController;
  String? Function(BuildContext, String?)?
      shortDescriptionTextControllerValidator;
  // State field(s) for about widget.
  FocusNode? aboutFocusNode;
  TextEditingController? aboutTextController;
  String? Function(BuildContext, String?)? aboutTextControllerValidator;
  // State field(s) for location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;
  // State field(s) for time widget.
  FocusNode? timeFocusNode;
  TextEditingController? timeTextController;
  String? Function(BuildContext, String?)? timeTextControllerValidator;
  // State field(s) for contact widget.
  FocusNode? contactFocusNode;
  TextEditingController? contactTextController;
  String? Function(BuildContext, String?)? contactTextControllerValidator;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? form1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    shortDescriptionFocusNode?.dispose();
    shortDescriptionTextController?.dispose();

    aboutFocusNode?.dispose();
    aboutTextController?.dispose();

    locationFocusNode?.dispose();
    locationTextController?.dispose();

    timeFocusNode?.dispose();
    timeTextController?.dispose();

    contactFocusNode?.dispose();
    contactTextController?.dispose();
  }
}

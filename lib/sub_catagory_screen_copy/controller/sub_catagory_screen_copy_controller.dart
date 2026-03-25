import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '../sub_catagory_screen_copy_model.dart';

/// GetX controller for [SubCatagoryScreenCopyWidget].
class SubCatagoryScreenCopyController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  SubCatagoryScreenCopyModel? model;
  bool _modelInitialized = false;

  void initModel(BuildContext context) {
    if (_modelInitialized) {
      return;
    }
    _modelInitialized = true;
    model = createModel(context, () => SubCatagoryScreenCopyModel());

    model?.textController1 ??= TextEditingController();
    model?.textFieldFocusNode1 ??= FocusNode();

    model?.textController2 ??= TextEditingController();
    model?.textFieldFocusNode2 ??= FocusNode();

    model?.textController3 ??= TextEditingController();
    model?.textFieldFocusNode3 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => notifyUi());
  }

  void notifyUi() {
    update();
  }

  @override
  void onClose() {
    model?.dispose();
    super.onClose();
  }
}

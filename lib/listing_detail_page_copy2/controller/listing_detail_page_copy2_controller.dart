import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '../listing_detail_page_copy2_model.dart';

/// GetX controller for [ListingDetailPageCopy2Widget].
class ListingDetailPageCopy2Controller extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ListingDetailPageCopy2Model? model;
  bool _modelInitialized = false;

  void initModel(BuildContext context) {
    if (_modelInitialized) {
      return;
    }
    _modelInitialized = true;
    model = createModel(context, () => ListingDetailPageCopy2Model());

    model?.switchValue1 = false;
    model?.textController1 ??= TextEditingController();
    model?.textFieldFocusNode1 ??= FocusNode();

    model?.textController2 ??= TextEditingController();
    model?.textFieldFocusNode2 ??= FocusNode();

    model?.textController3 ??= TextEditingController();
    model?.textFieldFocusNode3 ??= FocusNode();

    model?.switchValue2 = false;
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

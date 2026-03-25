import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '../home_page_dynamic_model.dart';

/// GetX controller for [HomePageDynamicWidget].
class HomePageDynamicController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  HomePageDynamicModel? model;
  bool _modelInitialized = false;

  void initModel(BuildContext context) {
    if (_modelInitialized) {
      return;
    }
    _modelInitialized = true;
    model = createModel(context, () => HomePageDynamicModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
      final st = scaffoldKey.currentState;
      if (st?.isDrawerOpen == true || st?.isEndDrawerOpen == true) {
        Get.back();
      }

      model?.selectedTab = 'HOME';
      notifyUi();
    });

    model?.textController1 ??= TextEditingController();
    model?.textFieldFocusNode1 ??= FocusNode();
    model?.textController2 ??= TextEditingController();
    model?.textFieldFocusNode2 ??= FocusNode();
    model?.textController3 ??= TextEditingController();
    model?.textFieldFocusNode3 ??= FocusNode();
    model?.textController4 ??= TextEditingController();
    model?.textFieldFocusNode4 ??= FocusNode();
    model?.textController5 ??= TextEditingController();
    model?.textFieldFocusNode5 ??= FocusNode();
    model?.textController6 ??= TextEditingController();
    model?.textFieldFocusNode6 ??= FocusNode();

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

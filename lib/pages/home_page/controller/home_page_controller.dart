import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '../home_page_model.dart';

/// GetX controller for [HomePageWidget].
class HomePageController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  HomePageModel? model;
  bool _modelInitialized = false;

  void initModel(BuildContext context) {
    if (_modelInitialized) {
      return;
    }
    _modelInitialized = true;
    model = createModel(context, () => HomePageModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      model?.selectedTab = 'HOME';
      notifyUi();
      setDarkModeSetting(context, ThemeMode.light);
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

    model?.switchValue = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => notifyUi());
  }

  void notifyUi() {
    update();
  }

  void onThemeSwitchChanged(BuildContext context, bool newValue) {
    model?.switchValue = newValue;
    update();
    if (newValue) {
      setDarkModeSetting(context, ThemeMode.dark);
    } else {
      setDarkModeSetting(context, ThemeMode.light);
    }
  }

  @override
  void onClose() {
    model?.dispose();
    super.onClose();
  }
}

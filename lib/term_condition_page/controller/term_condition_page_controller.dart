import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '../term_condition_page_model.dart';

/// GetX controller for [TermConditionPageWidget].
class TermConditionPageController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TermConditionPageModel? model;
  bool _modelInitialized = false;

  void initModel(BuildContext context) {
    if (_modelInitialized) {
      return;
    }
    _modelInitialized = true;
    model = createModel(context, () => TermConditionPageModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
    });

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

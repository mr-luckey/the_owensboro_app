import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '../wheel_adventure_screen_model.dart';

/// GetX controller for [WheelAdventureScreenWidget].
///
/// [GlobalKey] for [ScaffoldState] lives on each [State] instance, not here, so
/// the wheel screen can exist both in [IndexedStack] tabs and on the navigation
/// stack without duplicating the same key.
class WheelAdventureScreenController extends GetxController {
  WheelAdventureScreenModel? model;
  bool _modelInitialized = false;

  void initModel(BuildContext context) {
    if (_modelInitialized) {
      return;
    }
    _modelInitialized = true;
    model = createModel(context, () => WheelAdventureScreenModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      model?.selectedTab = 'Wheel of Adventure';
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

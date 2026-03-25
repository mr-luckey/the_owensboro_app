import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '../events_entertainment_screen_model.dart';

/// Page logic for [EventsEntertainmentScreenWidget].
class EventsEntertainmentScreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  EventsEntertainmentScreenModel? model;
  bool _modelInitialized = false;

  void initModel(BuildContext context) {
    if (_modelInitialized) {
      return;
    }
    model = createModel(context, () => EventsEntertainmentScreenModel());
    model?.switchValue = false;
    _modelInitialized = true;
  }

  /// Rebuilds UI after mutating [model] fields.
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

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '../user_side_sign_up_screen_model.dart';

/// GetX controller for [UserSideSignUpScreenWidget].
class UserSideSignUpScreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  UserSideSignUpScreenModel? model;
  bool _modelInitialized = false;

  void initModel(BuildContext context) {
    if (_modelInitialized) {
      return;
    }
    _modelInitialized = true;
    model = createModel(context, () => UserSideSignUpScreenModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
    });

    model?.textController1 ??= TextEditingController();
    model?.textFieldFocusNode1 ??= FocusNode();

    model?.textController2 ??= TextEditingController();
    model?.textFieldFocusNode2 ??= FocusNode();

    model?.emailTextController ??= TextEditingController();
    model?.textFieldFocusNode3 ??= FocusNode();

    model?.passwordTextController ??= TextEditingController();
    model?.textFieldFocusNode4 ??= FocusNode();

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

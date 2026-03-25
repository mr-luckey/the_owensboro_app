import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '../home_page_with_data_model.dart';

/// Holds page model and scaffold key for [HomePageWithDataWidget].
class HomePageWithDataController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  HomePageWithDataModel? model;
  bool _modelInitialized = false;

  void initModel(BuildContext context) {
    if (_modelInitialized) {
      return;
    }
    model = createModel(context, () => HomePageWithDataModel());
    _modelInitialized = true;
  }

  @override
  void onClose() {
    model?.dispose();
    super.onClose();
  }
}

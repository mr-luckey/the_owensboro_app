import 'package:get/get.dart';

import 'home_page_dynamic_controller.dart';

class HomePageDynamicBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<HomePageDynamicController>()) {
      Get.lazyPut<HomePageDynamicController>(HomePageDynamicController.new);
    }
  }
}

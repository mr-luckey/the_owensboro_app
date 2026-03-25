import 'package:get/get.dart';

import 'term_condition_page_controller.dart';

class TermConditionPageBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<TermConditionPageController>()) {
      Get.lazyPut<TermConditionPageController>(
        TermConditionPageController.new,
      );
    }
  }
}

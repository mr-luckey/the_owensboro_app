import 'package:get/get.dart';

import 'home_page_dynamic_copy_controller.dart';

class HomePageDynamicCopyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageDynamicCopyController>(
      HomePageDynamicCopyController.new,
    );
  }
}

import 'package:get/get.dart';

import 'sub_catagory_screen_copy_controller.dart';

class SubCatagoryScreenCopyBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<SubCatagoryScreenCopyController>()) {
      Get.lazyPut<SubCatagoryScreenCopyController>(
        SubCatagoryScreenCopyController.new,
      );
    }
  }
}

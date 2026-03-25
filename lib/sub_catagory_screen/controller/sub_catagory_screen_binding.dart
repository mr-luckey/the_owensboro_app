import 'package:get/get.dart';

import 'sub_catagory_screen_controller.dart';

class SubCatagoryScreenBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<SubCatagoryScreenController>()) {
      Get.lazyPut<SubCatagoryScreenController>(SubCatagoryScreenController.new);
    }
  }
}

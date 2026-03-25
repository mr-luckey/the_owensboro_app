import 'package:get/get.dart';

import 'wheel_adventure_screen_controller.dart';

class WheelAdventureScreenBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<WheelAdventureScreenController>()) {
      Get.lazyPut<WheelAdventureScreenController>(
        WheelAdventureScreenController.new,
      );
    }
  }
}

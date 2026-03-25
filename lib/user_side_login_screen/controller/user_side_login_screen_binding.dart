import 'package:get/get.dart';

import 'user_side_login_screen_controller.dart';

class UserSideLoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<UserSideLoginScreenController>()) {
      Get.lazyPut<UserSideLoginScreenController>(
        UserSideLoginScreenController.new,
      );
    }
  }
}

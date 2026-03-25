import 'package:get/get.dart';

import 'user_side_sign_up_screen_controller.dart';

class UserSideSignUpScreenBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<UserSideSignUpScreenController>()) {
      Get.lazyPut<UserSideSignUpScreenController>(
        UserSideSignUpScreenController.new,
      );
    }
  }
}

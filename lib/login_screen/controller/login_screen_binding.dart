import 'package:get/get.dart';

import 'login_screen_controller.dart';

class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<LoginScreenController>()) {
      Get.lazyPut<LoginScreenController>(LoginScreenController.new);
    }
  }
}

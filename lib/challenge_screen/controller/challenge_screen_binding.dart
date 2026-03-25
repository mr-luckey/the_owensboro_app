import 'package:get/get.dart';

import 'challenge_screen_controller.dart';

class ChallengeScreenBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<ChallengeScreenController>()) {
      Get.lazyPut<ChallengeScreenController>(ChallengeScreenController.new);
    }
  }
}

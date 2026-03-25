import 'package:get/get.dart';

import 'voting_screen_controller.dart';

class VotingScreenBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<VotingScreenController>()) {
      Get.lazyPut<VotingScreenController>(VotingScreenController.new);
    }
  }
}

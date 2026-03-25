import 'package:get/get.dart';

import 'owensboro_games_controller.dart';

class OwensboroGamesBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<OwensboroGamesController>()) {
      Get.lazyPut<OwensboroGamesController>(OwensboroGamesController.new);
    }
  }
}

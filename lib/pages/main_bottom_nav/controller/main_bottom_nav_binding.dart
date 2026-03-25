import 'package:get/get.dart';

import '/owensboro_games/controller/owensboro_games_controller.dart';
import '/pages/home_page_dynamic/controller/home_page_dynamic_controller.dart';
import '/pages/wheel_adventure_screen/controller/wheel_adventure_screen_controller.dart';

import 'main_bottom_nav_controller.dart';

/// Registers [MainBottomNavController] and tab controllers used inside
/// [IndexedStack] (they are not created via their own [GetPage] routes).
class MainBottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainBottomNavController>(MainBottomNavController.new);
    if (!Get.isRegistered<HomePageDynamicController>()) {
      Get.lazyPut<HomePageDynamicController>(HomePageDynamicController.new);
    }
    if (!Get.isRegistered<WheelAdventureScreenController>()) {
      Get.lazyPut<WheelAdventureScreenController>(
        WheelAdventureScreenController.new,
      );
    }
    if (!Get.isRegistered<OwensboroGamesController>()) {
      Get.lazyPut<OwensboroGamesController>(OwensboroGamesController.new);
    }
  }
}

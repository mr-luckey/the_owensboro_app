import 'package:get/get.dart';

/// Controls bottom navigation tab index for [MainBottomNavWidget].
class MainBottomNavController extends GetxController {
  late final RxInt currentIndex;

  @override
  void onInit() {
    super.onInit();
    final tabIndex =
        (Get.arguments as Map<String, dynamic>?)?['tabIndex'] as int?;
    currentIndex = (tabIndex ?? 0).obs;
  }

  void onTabTapped(int index) {
    if (index == currentIndex.value) {
      return;
    }
    currentIndex.value = index;
  }
}

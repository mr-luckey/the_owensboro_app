import 'package:get/get.dart';

import 'view_all_reviews_screen_controller.dart';

class ViewAllReviewsScreenBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<ViewAllReviewsScreenController>()) {
      Get.lazyPut<ViewAllReviewsScreenController>(
        ViewAllReviewsScreenController.new,
      );
    }
  }
}

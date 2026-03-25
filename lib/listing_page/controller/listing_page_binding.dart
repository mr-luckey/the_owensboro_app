import 'package:get/get.dart';

import 'listing_page_controller.dart';

class ListingPageBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<ListingPageController>()) {
      Get.lazyPut<ListingPageController>(ListingPageController.new);
    }
  }
}

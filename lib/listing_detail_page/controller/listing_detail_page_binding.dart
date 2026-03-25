import 'package:get/get.dart';

import 'listing_detail_page_controller.dart';

class ListingDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<ListingDetailPageController>()) {
      Get.lazyPut<ListingDetailPageController>(ListingDetailPageController.new);
    }
  }
}

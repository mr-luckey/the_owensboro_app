import 'package:get/get.dart';

import 'listing_detail_page_copy_controller.dart';

class ListingDetailPageCopyBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<ListingDetailPageCopyController>()) {
      Get.lazyPut<ListingDetailPageCopyController>(
        ListingDetailPageCopyController.new,
      );
    }
  }
}

import 'package:get/get.dart';

import 'listing_detail_page_copy2_controller.dart';

class ListingDetailPageCopy2Binding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<ListingDetailPageCopy2Controller>()) {
      Get.lazyPut<ListingDetailPageCopy2Controller>(
        ListingDetailPageCopy2Controller.new,
      );
    }
  }
}

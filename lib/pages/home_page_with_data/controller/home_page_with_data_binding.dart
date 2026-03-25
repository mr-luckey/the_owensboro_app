import 'package:get/get.dart';

import 'home_page_with_data_controller.dart';

class HomePageWithDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageWithDataController>(HomePageWithDataController.new);
  }
}

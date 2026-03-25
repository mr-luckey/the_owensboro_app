import 'package:get/get.dart';

import 'events_entertainment_screen_copy_copy_controller.dart';

class EventsEntertainmentScreenCopyCopyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventsEntertainmentScreenCopyCopyController>(
      EventsEntertainmentScreenCopyCopyController.new,
    );
  }
}

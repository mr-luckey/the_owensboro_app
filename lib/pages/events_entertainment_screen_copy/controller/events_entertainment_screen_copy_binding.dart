import 'package:get/get.dart';

import 'events_entertainment_screen_copy_controller.dart';

class EventsEntertainmentScreenCopyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventsEntertainmentScreenCopyController>(
      EventsEntertainmentScreenCopyController.new,
    );
  }
}

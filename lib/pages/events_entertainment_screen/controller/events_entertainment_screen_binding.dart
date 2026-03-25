import 'package:get/get.dart';

import 'events_entertainment_screen_controller.dart';

class EventsEntertainmentScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventsEntertainmentScreenController>(
      EventsEntertainmentScreenController.new,
    );
  }
}

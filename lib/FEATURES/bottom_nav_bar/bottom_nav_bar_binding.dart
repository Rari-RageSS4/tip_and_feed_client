import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/bottom_nav_bar/bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavBarController());
  }
}
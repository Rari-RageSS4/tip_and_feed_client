import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/view/tip_home/controller.dart';
import 'package:tip_and_feed_client/FEATURES/bottom_nav_bar/bottom_nav_bar_controller.dart';
import 'app.dart';
import 'injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await init();
  Get.put(BottomNavBarController());
 // Get.lazyPut<HomeController>(() => HomeController(sl(),sl(),));
  runApp(const MyApp());
}


import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/news/news_controller.dart';

import '../../../../injector.dart';
import 'controller.dart';


class HomeBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(sl(),sl(),));
    Get.lazyPut<NewsController>(() => NewsController());
  }
}
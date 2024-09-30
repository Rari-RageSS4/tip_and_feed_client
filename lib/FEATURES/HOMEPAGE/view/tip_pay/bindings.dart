import 'package:get/get.dart';

import '../../../../injector.dart';
import 'controller.dart';


class HomeBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(sl(),sl(),));
  }
}
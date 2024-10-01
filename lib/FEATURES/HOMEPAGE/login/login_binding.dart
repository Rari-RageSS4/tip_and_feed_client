import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/login/authentication.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/login/login_page.dart';

class LoginBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationController());
  }
}
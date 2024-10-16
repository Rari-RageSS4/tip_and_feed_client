import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/view/tip_home/bindings.dart';
//import 'package:tip_and_feed_client/FEATURES/bottom_nav_bar/bottom_nav_bar_binding.dart';

import 'common/routes/routes.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: Routes.routes,
        initialRoute: AppRoutes.bottomNavBar,
        initialBinding: HomeBinding(),
        theme: ThemeData.dark(),
    );
  }
}


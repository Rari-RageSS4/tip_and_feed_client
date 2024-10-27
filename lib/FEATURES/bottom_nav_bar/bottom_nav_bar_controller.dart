import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/view/tip_home/screen_ui.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/view/widgets/news_pageview_or_listview.dart';
import 'package:tip_and_feed_client/FEATURES/restaurants/restaurants_screen.dart';

class BottomNavBarController extends GetxController {
  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  var pages = <Widget>[
    const HomePage(),
    RestaurantsScreen(),
    const NewsPageviewOrListview(),
  ].obs;
}

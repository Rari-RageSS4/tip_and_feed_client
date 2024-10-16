import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/news/news_feeds.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/view/tip_home/screen_ui.dart';

class BottomNavBarController extends GetxController{

  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  var pages = <Widget>[
    const HomePage(),
    const NewsFeeds(),
  ].obs;

}
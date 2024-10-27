import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/news/news_feeds.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/view/widgets/news_pageview.dart';
import 'package:tip_and_feed_client/models/article.dart';

class NewsController extends GetxController {
  final pageViewController = PageController();

  // initially show listview
  RxBool showListView = true.obs;

  // toggle between pageview and listview
  void togglePages() {
    showListView.value = !showListView.value;
  }

  var newsList = <Article>[
    Article(
      title: 'Tech helps Singapore economy top forecasts in third quarter',
      source: 'Economic Times • 13m ago',
      imageUrl:
          'assets/newsfeed/newsfeed.png', // Update with the correct image path
      description: 'Singapore\'s economy exceeded expectations...',
      comments: "0", timeAgo: '7mo ago',
    ),
    Article(
      title: 'Tech helps Singapore economy top forecasts in third quarter',
      source: 'Economic Times • 13m ago',
      imageUrl:
          'assets/newsfeed/newsfeed.png', // Update with the correct image path
      description: 'Singapore\'s economy exceeded expectations...',
      comments: "0", timeAgo: '8mo ago',
    ),
    Article(
      title: 'Tech helps Singapore economy top forecasts in third quarter',
      source: 'Economic Times • 13m ago',
      imageUrl:
          'assets/newsfeed/newsfeed.png', // Update with the correct image path
      description: 'Singapore\'s economy exceeded expectations...',
      comments: "0", timeAgo: '9mo ago',
    ),
    Article(
      source: "Inc42",
      timeAgo: "7mo ago",
      title: "Swiggy Changes Its Registered Name Ahead Of IPO",
      comments: "0",
      imageUrl: "assets/newsfeed/newsfeed.png",
      description: 'Singapore\'s economy exceeded expectations...',
    ),
    Article(
      source: "Livemint",
      timeAgo: "8mo ago",
      title: "Ola Electric faces a bumpy road ahead",
      comments: "0",
      imageUrl: "assets/newsfeed/newsfeed.png",
      description: 'Singapore\'s economy exceeded expectations...',
    ),
  ].obs;
}

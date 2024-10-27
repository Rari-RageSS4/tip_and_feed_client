import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/news/news_controller.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/news/news_feeds.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/view/widgets/news_pageview.dart';

class NewsPageviewOrListview extends GetView<NewsController> {
  const NewsPageviewOrListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.showListView.value
            ? NewsFeeds(
                onTap: controller.togglePages,
              )
            : NewsPageView(
                onTap: controller.togglePages,
              );
      }),
    );
  }
}

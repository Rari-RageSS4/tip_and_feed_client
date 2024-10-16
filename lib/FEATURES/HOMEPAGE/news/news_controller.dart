import 'package:get/get.dart';
import 'package:tip_and_feed_client/models/article.dart';

class NewsController extends GetxController{
   var newsList = <Article>[
    Article(
      title: 'Tech helps Singapore economy top forecasts in third quarter',
      source: 'Economic Times • 13m ago',
      imageUrl: 'assets/newsfeed/newsfeed.png', // Update with the correct image path
      description: 'Singapore\'s economy exceeded expectations...',
    ),
  ].obs;
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/news/more_news.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/news/news_controller.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/news/news_details.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewsFeeds extends GetView<NewsController> {
  const NewsFeeds({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(),
          ),
          title: const Text("Medial"),
          centerTitle: true,
          elevation: 0,
          actions: const [
            // icon or image

            // text
            Text("Articles"),
          ],
        ),
        body: Obx(
          () {
            return ListView.builder(
              itemCount: controller.newsList.length,
              itemBuilder: (context, index) {
                var article = controller.newsList[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        // title
                        Text(
                          article.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // source
                        Text(
                          article.source,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 8),

                        //stack
                        Stack(
                          children: [
                            // image
                            Image.asset(article.imageUrl),
                            // overlay text
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: const Text(
                                  'Medial',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),
                        // description
                        Text(
                          article.description,
                          style: const TextStyle(fontSize: 16),
                        ),
                        // icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // icon & source together
                            Row(
                              children: [
                                // icon in container
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0XFFD0BFFF),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Icon(
                                    FontAwesomeIcons.link,
                                    color: Color(0XFFD0BFFF),
                                    size: 10,
                                  ),
                                ),

                                const SizedBox(
                                  width: 5,
                                ),

                                // text
                                const Text(
                                  'Source',
                                  style: TextStyle(
                                      color: Color(0XFFD0BFFF), fontSize: 12),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.bookmark),
                              onPressed: () {
                                // bookmark functionality
                              },
                            ),
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.repeat),
                              onPressed: () {
                                // repeat functionality
                              },
                            ),
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.heart),
                              onPressed: () {
                                // like functionality

                                // more news UI check
                                Get.to(const MoreNewsScreen());
                              },
                            ),
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.share),
                              onPressed: () {
                                // share functionality

                                // news details UI check
                                Get.to(const NewsDetailsScreen());
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

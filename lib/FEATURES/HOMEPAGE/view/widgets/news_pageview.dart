import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/news/news_controller.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/news/news_details.dart';

class NewsPageView extends GetView<NewsController> {
  final Function()? onTap;

  const NewsPageView({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(),
        ),
        title: const Text("Medial"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.view_module,
            ),
            onPressed: onTap,
          ),
        ],
      ),
      body: Stack(
        children: [
          // PageView in the background
          Positioned.fill(
            child: Obx(() {
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.newsList.length,
                itemBuilder: (context, index) {
                  var article = controller.newsList[index];
                  return SingleChildScrollView(
                    child: GestureDetector(
                      onTap: () {
                    // Navigate to NewsDetailsScreen
                    Get.to(() => NewsDetailsScreen(article: article));
                  },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          // Stack for image and overlay text
                          Stack(
                            children: [
                              // Image
                              Image.asset(
                                article.imageUrl,
                                width: Get.width,
                                height: 240,
                                fit: BoxFit.cover,
                              ),
                              // Overlay text
                              Positioned(
                                bottom: 0,
                                left: 1,
                                right: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Text(
                                      article.title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Content description and source
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              padding: const EdgeInsets.all(8),
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
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              article.source,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Description
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Singapore's economy exceeded expectations in Q3 due to increased demand for computer chips and AI-related products. "
                              "The Monetary Authority of Singapore will maintain the current exchange rate to manage inflation.",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          const SizedBox(height: 80), // Space before bottom icons
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          // Icons row at the bottom, placed above the PageView content
          Positioned(
            bottom: 0, // Stick to the bottom of the screen
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(0.1), // Background for the icons row
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon & Source
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0XFFD0BFFF),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          FontAwesomeIcons.link,
                          color: Color(0XFFD0BFFF),
                          size: 10,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'Source',
                        style: TextStyle(
                          color: Color(0XFFD0BFFF),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  // Icons (Bookmark, Repeat, Like, Share)
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.bookmark),
                    onPressed: () {
                      // Bookmark functionality
                    },
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.repeat),
                    onPressed: () {
                      // Repeat functionality
                    },
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.heart),
                    onPressed: () {
                      // Like functionality
                    },
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.share),
                    onPressed: () {
                      // Share functionality
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

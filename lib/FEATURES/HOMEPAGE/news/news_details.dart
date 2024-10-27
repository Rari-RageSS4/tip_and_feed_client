import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/news/more_news.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/news/news_controller.dart';
import 'package:tip_and_feed_client/models/article.dart';

class NewsDetailsScreen extends GetView<NewsController> {
  final Article article;
  const NewsDetailsScreen({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          title: const Text('News on Medial'),
          actions: const [
            Icon(FontAwesomeIcons.house),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imageWithOverlayText(),

                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        // Icon representing the source
                        Icon(Icons.business, color: Colors.red),
                        SizedBox(width: 8),
                        // Source and time information
                        Text(
                          'Economic Times • 13m ago',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Main article text
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Singapore's economy exceeded expectations in Q3 due to increased demand for computer chips and artificial intelligence-related products. "
                      "The manufacturing sector, particularly tech manufacturing, drove the 4.1% YoY growth. "
                      "The government has revised its economic growth forecast for the year and expects growth to surpass the upper end of the range. "
                      "The Monetary Authority of Singapore will maintain the current exchange rate to manage inflation. The ongoing upswing in electronics and trade cycles, "
                      "along with improved global financial conditions, are expected to sustain Singapore's growth for the rest of 2024.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 20),

                  icons(),
                ],
              ),
            ),
            const SliverFillRemaining(child: MoreNewsScreen())
          ],
        ),
      ),
    );
  }

  // icons under list item
  Padding icons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
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
                style: TextStyle(color: Color(0XFFD0BFFF), fontSize: 12),
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
            },
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.share),
            onPressed: () {
              // share functionality
            },
          ),
        ],
      ),
    );
  }

  Stack imageWithOverlayText() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: Image.asset(
            'assets/newsfeed/newsfeed.png',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const Positioned(
          bottom: 40,
          left: 16,
          child: SizedBox(
            child: Text(
              'Tech helps Singapore economy top forecasts in third quarter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
            ),
          ),
        ),

        // medial
        Positioned(
          bottom: -5,
          left: 0,
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

        // Read More
        Positioned(
          bottom: -5,
          right: 0,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0XFFD0BFFF),
              ),
              child: Center(
                child: Text(
                  'Read More',
                  style: TextStyle(color: Colors.deepPurple[400]),
                  //textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

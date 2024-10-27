import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/news/news_controller.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class MoreNewsScreen extends GetView<NewsController> {
  const MoreNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverStickyHeader(
          header: commentRepostButton(),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 40,
                ),

                // comment img
                Center(
                  child: Image.asset(
                    'assets/newsfeed/comment.png',
                    width: 100,
                    height: 100,
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),

                const Center(
                  child: Text(
                    'No comments yet. Be the first to comment',
                    style: TextStyle(fontSize: 12),
                  ),
                ),

                const SizedBox(
                  height: 12,
                ),

                // Input for comment
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.grey[900],
                      hintText: 'Add your comment',
                      suffixIcon: const Icon(Icons.send),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),

        // More like this
        SliverStickyHeader(
          header: const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'More like this',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Recommendations from Medial',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
          // more news list
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                moreNewsListview(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // comment and repost
  Row commentRepostButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // comments
        Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color.fromARGB(51, 208, 191, 255),
          ),
          child: const Center(child: Text('Comments')),
        ),

        const SizedBox(
          width: 15,
        ),

        // repost
        Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color.fromARGB(95, 158, 158, 158),
          ),
          child: const Center(child: Text('Reposts')),
        )
      ],
    );
  }

  // more news list
  SizedBox moreNewsListview() {
    return SizedBox(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: List.generate(controller.newsList.length, (index) {
            var moreNewsArticle = controller.newsList[index];
            return GestureDetector(
              onTap: () {
                //  Get.to(() => );
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade900,
                      blurRadius: 6.0,
                      spreadRadius: 1.0,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${moreNewsArticle.source} • ${moreNewsArticle.timeAgo}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            moreNewsArticle.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            '${moreNewsArticle.comments} Comments',
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        moreNewsArticle.imageUrl,
                        height: 100.0,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

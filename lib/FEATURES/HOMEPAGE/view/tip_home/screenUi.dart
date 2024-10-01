import 'package:flutter/material.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/view/widgets/appBar_homePage.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/view/widgets/headings.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/view/widgets/hotel_list.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/view/widgets/tip_box/tip_and_feed.dart';
import '../../../../common/styles/app_gaps.dart';
import '../../../../common/styles/colors.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar
      appBar: CustomAppBar(),
      // Background color for the entire page
      backgroundColor: AppColors.backgroundAppBarColor,
      // Main content of the page
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Medium gap to create space below the AppBar
            AppGaps.gapMedium,

            // Widget displaying payment methods
            PaymentMethodsGrid(),

            // Extra large gap between sections
            AppGaps.gapExtraLarge,

            // Row for the section heading
            tipAndFeedHeading,

            // Another section of the page, such as a list of task cards
            TaskCardContainer(),
          ],
        ),
      ),
    );
  }
}



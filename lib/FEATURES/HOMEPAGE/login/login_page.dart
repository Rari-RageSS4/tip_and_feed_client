import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/login/authentication.dart';
//import 'package:lottie/lottie.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/login/lottie_pages/page1.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/login/lottie_pages/page2.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/login/lottie_pages/page3.dart';

class LoginPage extends GetView<AuthenticationController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //lottie
          SizedBox(
            height: 440,
            child: PageView(
              controller: controller.pageController,
              children: const [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),

          //dot indicators
          _buildSmoothPageIndicator(),

          const Spacer(),

          // title
          const Text(
            'MEDIAL',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          // login button
          ElevatedButton.icon(
            onPressed: controller.signInWithGoogle,
            label: const Text(
              'Login with Google',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              textStyle: const TextStyle(fontSize: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),

          const Spacer(),

          // text terms
          const Padding(
            padding: EdgeInsets.all(40.0),
            child: Text(
              'By clicking Login, you agree to our Terms and acknowledge that you have read our Privacy Policy, which explains how to opt out of offers and promos',
              style: TextStyle(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }

  SmoothPageIndicator _buildSmoothPageIndicator() {
    return SmoothPageIndicator(
      controller: controller.pageController,
      count: 3,
      effect: JumpingDotEffect(
        activeDotColor: Colors.white,
        dotColor: Colors.grey[600] ?? Colors.grey,
        dotHeight: 10,
        dotWidth: 10,
        spacing: 15,
        verticalOffset: 15,
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/login/Authentication.dart';
import 'package:lottie/lottie.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/login/lottie_pages/page1.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/login/lottie_pages/page2.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/login/lottie_pages/page3.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final AuthenticationController _auth = AuthenticationController();
  GoogleSignInAccount? _currentUser;
  final _controller = PageController();

  late Timer _timer; // Declare the timer

  int _currentPage = 0;
  final int _totalPages = 3;

  @override
  void initState() {
    super.initState();

    // Start a timer to auto-switch pages every 3 seconds
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _totalPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Reset to the first page
      }
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });

    // user change

    _auth.googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _auth.googleSignIn.signInSilently();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    _controller.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _currentUser;
    return Scaffold(
      body: user != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hello, ${user.displayName}!'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _auth.signOutGoogle,
                    child: const Text('Sign Out'),
                  ),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //lottie
                SizedBox(
                  height: 440,
                  child: PageView(
                    controller: _controller,
                    children: const [
                      Page1(),
                      Page2(),
                      Page3(),
                    ],
                  ),
                ),

                //dot indicators
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const JumpingDotEffect(
                      activeDotColor: Colors.black,
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 15,
                      verticalOffset: 15),
                ),

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
                  onPressed: _auth.signInWithGoogle,
                  label: const Text(
                    'Sign In with Google',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 50),
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
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),

                const Spacer(),
              ],
            ),
    );
  }
}

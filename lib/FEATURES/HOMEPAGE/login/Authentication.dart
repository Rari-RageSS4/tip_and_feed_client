import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthenticationController extends GetxController {

  final Rx<GoogleSignInAccount?> _currentUser = Rx<GoogleSignInAccount?>(null);
  
  final pageController = PageController();

  late Timer _timer; // Declare the timer

  int _currentPage = 0;
  final int _totalPages = 3;

  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

 // @override
  void initState() {
  //  super.initState();

    // Start a timer to auto-switch pages every 3 seconds
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _totalPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Reset to the first page
      }
      pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });


    // user change
    googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) {
      _currentUser.value = account;
      googleSignIn.signInSilently();
    });
    
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    pageController.dispose(); // Dispose of the controller
    super.dispose();
  }


  // SIGN IN
  Future<void> signInWithGoogle() async {
    try {
      // Trigger the Google sign-in process
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled the sign-in process
        return;
      }

      // Obtain the auth details (accessToken) from the Google account
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Get the ID token and access token
      String? idToken = googleAuth.idToken;
      String? accessToken = googleAuth.accessToken;

      // You can now send the tokens to your backend for further verification
      // Or use the access token to call Google APIs

      print('ID Token: $idToken');
      print('Access Token: $accessToken');
    } catch (error) {
      print('Error during Google Sign-In: $error');
    }
  }

  // ACCESS TOKEN

  Future<void> fetchGoogleProfile(String accessToken) async {
  final response = await http.get(
    Uri.parse('https://www.googleapis.com/oauth2/v1/userinfo?alt=json'),
    headers: {
      'Authorization': 'Bearer $accessToken',
    },
  );
  
  if (response.statusCode == 200) {
    final profileData = json.decode(response.body);
    print('User profile data: $profileData');
  } else {
    print('Failed to fetch profile data');
  }
}

  // SIGN OUT

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
    print("User signed out");
  }
}

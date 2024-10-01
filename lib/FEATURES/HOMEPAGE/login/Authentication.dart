import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthenticationController extends GetxController {

  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );


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

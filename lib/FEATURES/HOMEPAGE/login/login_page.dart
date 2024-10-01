import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tip_and_feed_client/FEATURES/HOMEPAGE/login/Authentication.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
   final AuthenticationController _auth = AuthenticationController();
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _auth.googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _auth.googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sign-In'),
      ),
      body: Center(
        child: user != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hello, ${user.displayName}!'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _auth.signOutGoogle,
                    child: const Text('Sign Out'),
                  ),
                ],
              )
            : ElevatedButton(
                onPressed: _auth.signInWithGoogle,
                child: const Text('Sign In with Google'),
              ),
      ),
    );
  }
}

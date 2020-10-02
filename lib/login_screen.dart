import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tsf_social_media_integration/API/auth.dart';
import 'package:tsf_social_media_integration/widgets/loginButton.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoggedIn = false;
  final auth = AuthProvider();
  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginButton(
              backgroundColor: Vx.white,
              logoAsset: AssetImage('assets/images/google_logo1.png'),
              onPressed: () async {
                user = await auth.loginWithGoogle();
              },
              text: "Login With Google",
            ),
            SizedBox(
              height: 15,
            ),
            LoginButton(
              backgroundColor: Vx.blue800,
              logoAsset: AssetImage('assets/images/facebook_logo.png'),
              onPressed: () async {
                user = await auth.loginWithFaceBook();
              },
              text: "Login With Facebook",
            ),
            SizedBox(
              height: 15,
            ),
            LoginButton(
              backgroundColor: Color(0xff32DEF3),
              logoAsset: AssetImage('assets/images/twitter_logo.png'),
              onPressed: () async {
                user = await auth.loginWithTwitter();
              },
              text: "Login With Twitter",
            ),
          ],
        ).p16(),
      ),
    );
  }
}

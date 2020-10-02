import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:tsf_social_media_integration/widgets/loginButton.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoggedIn = false;

  var profileData;
  List profileLog;

  var facebookLogin = FacebookLogin();

  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: isLoggedIn
          ? Container(
              child: Center(
                child: Text('User is Logged In'),
              ),
            )
          : Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginButton(
                    backgroundColor: Vx.white,
                    logoAsset: AssetImage('assets/images/google_logo1.png'),
                    onPressed: () {},
                    text: "Login With Google",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  LoginButton(
                    backgroundColor: Vx.blue800,
                    logoAsset: AssetImage('assets/images/facebook_logo.png'),
                    onPressed: () {},
                    text: "Login With Facebook",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  LoginButton(
                    backgroundColor: Color(0xff32DEF3),
                    logoAsset: AssetImage('assets/images/twitter_logo.png'),
                    onPressed: () {},
                    text: "Login With Twitter",
                  ),
                ],
              ).p16(),
            ),
    );
  }
}

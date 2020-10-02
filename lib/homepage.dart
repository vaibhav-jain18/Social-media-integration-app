import 'package:flutter/material.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:tsf_social_media_integration/API/auth.dart';
import 'package:tsf_social_media_integration/login_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String message = "defaultmessage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Login"),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen())),
            ),
            SizedBox(height: 32.0),
            Text(message),
          ],
        ),
      ),
    );

    // return CircularProgressIndicator();
  }

  // void _login() async {
  //   final TwitterLoginResult result = await twitterLogin.authorize();
  //   String newMessage;
  //   switch (result.status) {
  //     case TwitterLoginStatus.loggedIn:
  //       newMessage = 'Logged in! username: ${result.session.username}';
  //       break;
  //     case TwitterLoginStatus.cancelledByUser:
  //       newMessage = 'Login cancelled by user.';
  //       break;
  //     case TwitterLoginStatus.error:
  //       newMessage = 'Login error: ${result.errorMessage}';
  //       break;
  //   }
  //   setState(() {
  //     message = newMessage;
  //   });
  // }
}

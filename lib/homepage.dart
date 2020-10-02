import 'package:flutter/material.dart';
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
}

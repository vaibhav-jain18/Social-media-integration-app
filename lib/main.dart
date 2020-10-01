import 'package:flutter/material.dart';
import 'package:tsf_social_media_integration/homepage.dart';
import 'package:tsf_social_media_integration/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}

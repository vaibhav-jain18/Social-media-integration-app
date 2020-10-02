import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tsf_social_media_integration/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return null;
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              initialRoute: '/',
              routes: {
                '/': (context) => HomePage(),
              },
            );
          }
          return CircularProgressIndicator();
        });
  }
}

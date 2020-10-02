import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tsf_social_media_integration/API/auth.dart';
import 'package:tsf_social_media_integration/login_screen.dart';
import 'package:tsf_social_media_integration/profileScreen.dart';

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
                '/': (context) => AuthListener(),
              },
            );
          }
          return CircularProgressIndicator();
        });
  }
}

class AuthListener extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: AuthProvider().onAuthStateChanged,
      builder: (context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signin = (snapshot.hasData && snapshot.data != null);
          return signin ? ProfileScreen(user: snapshot.data) : LoginScreen();
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

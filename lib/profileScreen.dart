import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tsf_social_media_integration/API/auth.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  ProfileScreen({@required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "UserProfile".text.make(),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              "User Logged in ${user.displayName}"
                  .text
                  .xl2
                  .black
                  .semiBold
                  .wide
                  .make(),
              20.heightBox,
              RaisedButton(
                child: "Logout".text.xl.make(),
                onPressed: () {
                  AuthProvider().logout();
                  // Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

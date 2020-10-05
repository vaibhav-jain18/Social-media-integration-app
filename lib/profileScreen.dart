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
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                child: Image.network(
                  "${user.photoURL}",
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        child: Text("Your name : ",
                            style: TextStyle(fontSize: 20.0)),
                      ),
                      Container(
                        child: Text("${user.displayName}",
                            style: TextStyle(fontSize: 20.0)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          "Your email : ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Container(
                        child: Text("${user.email}",
                            style: TextStyle(fontSize: 20.0)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
                child: RaisedButton(
                  child: "Logout".text.xl.make(),
                  onPressed: () {
                    AuthProvider().logout();
                    // Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

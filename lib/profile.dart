import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({this.profileData});
  final profileData;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User\'s Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    widget.profileData['picture']['data']['url'],
                  ),
                ),
              ),
            ),
            SizedBox(height: 28.0),
            Text(
              "Logged in as: ${widget.profileData['name']}",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              "Email id is: ${widget.profileData['email']}",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            RaisedButton(
              child: Text("Logout"),
              onPressed: () => Navigator.pop(context, [true]),
            ),
          ],
        ),
      ),
    );
  }
}

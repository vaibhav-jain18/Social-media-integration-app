import 'package:flutter/material.dart';

class FacebookProfile extends StatefulWidget {
  FacebookProfile({this.imageUrl, this.data});
  final imageUrl;
  final data;
  @override
  _FacebookProfileState createState() => _FacebookProfileState();
}

class _FacebookProfileState extends State<FacebookProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  widget.data['picture']['data']['url'],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

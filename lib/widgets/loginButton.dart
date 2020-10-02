import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginButton extends StatelessWidget {
  final backgroundColor;
  final AssetImage logoAsset;
  final String text;
  final Function onPressed;

  LoginButton(
      {@required this.backgroundColor,
      @required this.logoAsset,
      @required this.onPressed,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: RaisedButton(
        color: backgroundColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              image: logoAsset,
              height: 40,
            ),
            SizedBox(
              width: 15,
            ),
            text.text.xl.black.semiBold.make()
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}

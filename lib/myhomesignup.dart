import 'package:flutter/material.dart';
import './custom_icon_icons.dart';
import './signup.dart';

class MyHomePageSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.cyan[900],
      body: Stack(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter:
                    ColorFilter.mode(Colors.transparent, BlendMode.hardLight),
                image: AssetImage("asset/image/Mask Group -1.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              children: <Widget>[
                FlatButton(
                  color: Colors.cyan[900],
                  child: Row(
                    children: <Widget>[
                      Icon(
                        CustomIcon.icon_ionic_md_arrow_round_back,
                        color: Colors.white,
                      ),
                      Text(
                        '   Back',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onPressed: () => {Navigator.pushNamed(context, '/')},
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 180, left: 30),
            padding: EdgeInsets.all(10),
            child: Container(
              child: RichText(
                text: TextSpan(
                  text: 'Create New Account',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
          SignUp(),
        ],
      ),
    );
  }
}

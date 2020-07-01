import 'package:flutter/material.dart';
import './login.dart';

class MyHomePageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.cyan[900],
      body: Stack(
        children: <Widget>[
          Container(
            height: 550,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter:
                    ColorFilter.mode(Colors.transparent, BlendMode.hardLight),
                image: AssetImage("asset/image/Mask Group 1.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 300, left: 30),
            padding: EdgeInsets.all(10),
            child: Container(
              child: RichText(
                text: TextSpan(
                  text: '___\nWelcome ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n to Room Control',
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Login(),
        ],
      ),
    );
  }
}

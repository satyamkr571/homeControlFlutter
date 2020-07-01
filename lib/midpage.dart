import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyHomeMidPage extends StatefulWidget {
  MyHomeMidPage({Key key}) : super(key: key);

  @override
  _AminationmidPage createState() => _AminationmidPage();
}

class _AminationmidPage extends State<MyHomeMidPage>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.cyan[900],
      body: Stack(
        children: <Widget>[
          Container(
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter:
                    ColorFilter.mode(Colors.transparent, BlendMode.hardLight),
                image: AssetImage("asset/image/Mask Group 1.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            child: Container(
              child: Center(
                child: Image(
                  image: AssetImage("asset/image/Group 61.png"),
                ),
              ),
            ),
            builder: (BuildContext context, Widget child) {
              return Transform.rotate(
                angle: _controller.value * 1.5 * math.pi,
                child: Center(
                  child: Transform.scale(
                      scale: 2.0,
                      child: Image(
                        image: AssetImage("asset/image/Group 61.png"),
                      )),
                ),
              );

              // Transform.scale(
              //     scale:2.0,
              //     child: Center(
              //       child: Image(
              //         image: AssetImage("asset/image/Group 61.png"),
              //       ),
              //     ),
              //   ),
              // Transform.rotate(
              //   angle: _controller.value * 2.0 * math.pi,
              //   child: Image(
              //    image: AssetImage("asset/image/Group 61.png"),
              // );
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 600, left: 40),
            child: RichText(
              text: TextSpan(
                text: 'Let\'s get you started',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.normal),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

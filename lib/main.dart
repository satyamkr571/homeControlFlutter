import 'package:flutter/material.dart';
import './myhomepagelogin.dart';
import './myhomesignup.dart';
import './midpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Control',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Colors.green[900]),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePageLogin(),
        '/signup': (context) => MyHomePageSignUp(),
        '/midpage': (context) => MyHomeMidPage(),
      },
    );
  }
}

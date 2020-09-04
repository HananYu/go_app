import 'package:flutter/material.dart';
import 'system/splash.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return new MaterialApp(
      title: 'main',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: new SplashPage(),
    );
  }
}

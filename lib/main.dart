import 'package:flutter/material.dart';
import 'demo/index.dart';
import 'system/splash.dart';
import 'system/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return new MaterialApp(
      title: 'main',
      routes: <String, WidgetBuilder>{
        //配置路径
        '/index': (BuildContext context) => new Index(),
        '/login': (BuildContext context) => new LoginPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: new SplashPage(),
    );
  }
}

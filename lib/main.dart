import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'home_coins.dart';
import 'main_home.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Main_Home(),
      // home: const Home_CoinsMyAppTest(),
    );
  }
}

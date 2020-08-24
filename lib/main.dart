import 'package:flutter/material.dart';
// import 'package:quizapp/Home.dart';
import 'package:quizapp/bottomBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MySplash(),
      home: BottomBar(),
    );
  }
}
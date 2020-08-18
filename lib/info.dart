import 'package:flutter/material.dart';
// import 'packag';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF242A40),
      body: TextView(),
    );
  }
}

class TextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Center(
        child: Text("",
        style: TextStyle(
          fontSize: 19,
          color: Colors.amberAccent
        ),
        ),
      ),
    );
  }
}
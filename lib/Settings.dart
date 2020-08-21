import 'package:flutter/material.dart';

Widget settingsPage(BuildContext context) {
  var mda = MediaQuery.of(context);
  return Expanded(
      child: SafeArea(
              child: Container(
          width: mda.size.width,
    decoration: BoxDecoration(
            color: Colors.amberAccent, borderRadius: BorderRadius.circular(5)),
    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Center(
              child: Text('Settings', style: TextStyle(color: Color(0xFF242A40),
              fontSize: 40,
              )),
              
        ),
      )));
}

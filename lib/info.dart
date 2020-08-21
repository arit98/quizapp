import 'package:flutter/material.dart';

Widget infoPage(BuildContext context) {
  var mda = MediaQuery.of(context);
  return Expanded(
      child: SafeArea(
              child: Container(
    width: mda.size.width,
    decoration: BoxDecoration(
          color: Colors.amberAccent, borderRadius: BorderRadius.circular(5)),
    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
    child: Center(
        child: Text(
          'Info',
          style: TextStyle(color: Color(0xFF242A40),
          fontSize: 40,
        ),
    ),
  ),
      )));
}

// class InfoPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF242A40),
//       body: TextView(),
//     );
//   }
// }

// class TextView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 50),
//       child: Center(
//         child: Text("",
//         style: TextStyle(
//           fontSize: 19,
//           color: Colors.amberAccent
//         ),
//         ),
//       ),
//     );
//   }
// }

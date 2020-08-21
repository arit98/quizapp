import 'package:flutter/material.dart';
import 'package:quizapp/Home.dart';
import 'package:quizapp/ResultScreen.dart';
import 'package:quizapp/Settings.dart';
import 'package:quizapp/info.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    // var mda = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Color(0xFF242A40),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //tabs{
          _index == 0
              ? infoPage(context)
              : (_index == 1
                  ? HomePage()
                  : _index == 2 ? ResultScreen() : settingsPage(context)),
          // }row
          Expanded(
            child: Row(
              children: [
//1
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _index = 0;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: _index == 0
                            ? Colors.amberAccent
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info,
                            color: _index == 0
                                ? Color(0xFF242A40)
                                : Colors.amberAccent,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              'Info',
                              style: TextStyle(
                                  color: _index == 0
                                      ? Color(0xFF242A40)
                                      : Colors.amberAccent),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _index = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: _index == 1
                            ? Colors.amberAccent
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.home,
                            color: _index == 1
                                ? Color(0xFF242A40)
                                : Colors.amberAccent,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              'Home',
                              style: TextStyle(
                                  color: _index == 1
                                      ? Color(0xFF242A40)
                                      : Colors.amberAccent),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _index = 2;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: _index == 2
                            ? Colors.amberAccent
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.score,
                            color: _index == 2
                                ? Color(0xFF242A40)
                                : Colors.amberAccent,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              'Score',
                              style: TextStyle(
                                  color: _index == 2
                                      ? Color(0xFF242A40)
                                      : Colors.amberAccent),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _index = 3;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: _index == 3
                            ? Colors.amberAccent
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: _index == 3
                                ? Color(0xFF242A40)
                                : Colors.amberAccent,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              'Settings',
                              style: TextStyle(
                                  color: _index == 3
                                      ? Color(0xFF242A40)
                                      : Colors.amberAccent),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget home(BuildContext context) {
  return Expanded(
      child:
          Center(child: Text('Home', style: TextStyle(color: Colors.white))));
}

Widget score(BuildContext context) {
  return Expanded(
      child:
          Center(child: Text('Result', style: TextStyle(color: Colors.white))));
}

Widget info(BuildContext context) {
  return Expanded(
      child:
          Center(child: Text('Info', style: TextStyle(color: Colors.white))));
}

Widget settings(BuildContext context) {
  return Expanded(
      child: Center(
          child: Text('Settings', style: TextStyle(color: Colors.white))));
}

// class BtmBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: Colors.amberAccent,
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 40),
//         child: Padding(
//           padding: const EdgeInsets.all(5),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 onPressed: () {
//                   // Navigator.push(
//                   //       context,
//                   //       MaterialPageRoute(builder: (context) => infoPage()),
//                   //     );
//                 },
//                 icon: Icon(Icons.info, size: 30, color: Color(0xFF242A40)),
//               ),
//               IconButton(
//                 onPressed: () {
//                   Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => MainScreen()),
//                       );
//                 },
//                 icon: Icon(Icons.home, size: 30, color: Color(0xFF242A40)),
//               ),
//               IconButton(
//                 onPressed: () {
//                   Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => MainScreen()),
//                       );
//                 },
//                 icon: Icon(Icons.settings, size: 30, color: Color(0xFF242A40)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

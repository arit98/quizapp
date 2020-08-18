import 'package:flutter/material.dart';
// import 'package:quizapp/info.dart';
import 'package:quizapp/mscreen.dart';

class BtmBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.amberAccent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  // Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => infoPage()),
                  //     );
                },
                icon: Icon(Icons.info, size: 30, color: Color(0xFF242A40)),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ButtonNav()),
                      );
                },
                icon: Icon(Icons.home, size: 30, color: Color(0xFF242A40)),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ButtonNav()),
                      );
                },
                icon: Icon(Icons.settings, size: 30, color: Color(0xFF242A40)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

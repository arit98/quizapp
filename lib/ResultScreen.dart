import 'package:flutter/material.dart';
import 'package:quizapp/mscreen.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  ResultScreen({this.score});

  @override
  Widget build(BuildContext context) {
    var mda = MediaQuery.of(context);
    return Expanded(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xFF242A40),
          body: SingleChildScrollView(
            child: Container(
              width: mda.size.width,
              height: mda.size.height,
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  Image(
                    image: AssetImage('images/logo.png'),
                    width: mda.size.width,
                    height: 85,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Result',
                    style: TextStyle(
                      color: Color(0xFF242A40),
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '$score/10',
                    style: TextStyle(
                      color: Color(0xFF242A40),
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 30,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF242A40),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'RESTART',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      color: Color(0xFF242A40),
                      textColor: Colors.amberAccent,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 85,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          'EXIT',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        color: Color(0xFF242A40),
                        textColor: Colors.amberAccent,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quizapp/bottomBar.dart';
import 'package:quizapp/mscreen.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MySplash(),
      home: ButtonNav(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BtmBar(),
      backgroundColor: Color(0xFF242A40),
      body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(5)),
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: Image(image: AssetImage('images/logo.png')),
                    height: 231,
                    width: 200,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "QuizGo!!!",
                  style: TextStyle(fontSize: 34, color: Color(0xFF242A40)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ButtonNav()),
                        );
                      },
                      color: Color(0xFF242A40),
                      textColor: Colors.amberAccent,
                      child: Text("PLAY".toUpperCase(),
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      backgroundColor: Color(0xFF242A40),
      image: Image(image: AssetImage('images/logo.png')),
      photoSize: 150,
      loaderColor: Colors.amberAccent,
      navigateAfterSeconds: HomePage(),
    );
  }
}

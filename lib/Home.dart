import 'package:flutter/material.dart';
import 'package:quizapp/bottomBar.dart';
import 'package:quizapp/mscreen.dart';
import 'package:splashscreen/splashscreen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mda = MediaQuery.of(context);
    return Expanded(
      child: Container(
        width: mda.size.width,
        height: mda.size.height,
        decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 75),
              Container(
                child: Image(image: AssetImage('images/logo.png')),
                height: 85,
                width: mda.size.width,
              ),
              SizedBox(height: 45),
              Text(
                "QuizGo!!!",
                style: TextStyle(fontSize: 40, color: Color(0xFF242A40)),
              ),
              SizedBox(
                height: 120,
              ),
              Container(
                height: 70,
                width: mda.size.width,
                margin: EdgeInsets.only(left: 30, right: 30),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  color: Color(0xFF242A40),
                  textColor: Colors.amberAccent,
                  child: Text("PLAY".toUpperCase(),
                      style: TextStyle(fontSize: 20)),
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
      photoSize: 75,
      loaderColor: Colors.amberAccent,
      navigateAfterSeconds: BottomBar(),
    );
  }
}

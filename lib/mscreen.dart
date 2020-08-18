import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quizapp/bottomBar.dart';
import 'package:http/http.dart' as uri;
import 'package:quizapp/quizHelper.dart';

class ButtonNav extends StatefulWidget {
  @override
  _ButtonNavState createState() => _ButtonNavState();
}

class _ButtonNavState extends State<ButtonNav> {
  String api =
      'https://opentdb.com/api.php?amount=10&category=18&type=multiple';

  QuizHelper qz;

  int currentQues = 0;

  int totalSec = 5;
  int ellapsedSec = 0;

  Timer timer;

  int score = 0;

  @override
  void initState() {
    fetchAllqz();
    super.initState();
  }

  fetchAllqz() async {
    var response = await uri.get(api);
    var body = response.body;
    var json = jsonDecode(body);

    print(body);
    setState(() {
      qz = QuizHelper.fromJson(json);
      qz.results[currentQues].incorrectAnswers
          .add(qz.results[currentQues].correctAnswer);
      qz.results[currentQues].incorrectAnswers.shuffle();
      initTimer();
    });
  }

  initTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (t.tick == totalSec) {
        print("Time Complete");
        t.cancel();
        changeQues();
      } else {
        setState(() {
          ellapsedSec = t.tick;
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  checkAns(ans) {
    String currectAns = qz.results[currentQues].correctAnswer;

    if (ans == currectAns) {
      score += 1;
      print('Currect');
    } else {
      print('Wrong');
    }
    changeQues();
  }

  changeQues() {
    timer.cancel();
    if (currentQues == qz.results.length - 1) {
      print(score);
    } else {
      setState(() {
        currentQues += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (qz != null) {
      return Scaffold(
        bottomNavigationBar: BtmBar(),
        backgroundColor: Color(0xFF242A40),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage('images/logo.png'),
                        height: 150,
                        width: 150,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150),
                            color: Colors.amberAccent),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            '${ellapsedSec}s',
                            style: TextStyle(
                                fontSize: 30, color: Color(0xFF242A40)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Q. ${qz.results[currentQues].question}?',
                      style: TextStyle(color: Colors.amberAccent, fontSize: 33),
                    ),
                  ),
                ),
                //options
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Column(
                    children:
                        qz.results[currentQues].incorrectAnswers.map((option) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: RaisedButton(
                          color: Colors.amberAccent,
                          onPressed: () {
                            checkAns(option);
                          },
                          child: Text(
                            option,
                            style: TextStyle(
                                fontSize: 19, color: Color(0xFF242A40)),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
          backgroundColor: Color(0xFF242A40),
          body: Center(child: CircularProgressIndicator()));
    }
  }
}

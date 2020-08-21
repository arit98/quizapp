import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quizapp/ResultScreen.dart';
import 'package:http/http.dart' as uri;
import 'package:quizapp/quizHelper.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // variable
  String api =
      'https://opentdb.com/api.php?amount=10&category=18&type=multiple';
  QuizHelper qz;
  int currentQues = 0;
  int totalSec = 30;
  int ellapsedSec = 1;
  Timer timer;
  int score = 0;

  @override
  void initState() {
    // fetch question here
    // init
    fetchAllQuiz();
    super.initState();
  }

  fetchAllQuiz() async {
    var response = await uri.get(api);
    var body = response.body;
    var json = jsonDecode(body);
    // set state
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
        print('Time completed');
        t.cancel();
        changeQuestion();
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

  checkAnswer(answer) {
    String correctAnswer = qz.results[currentQues].correctAnswer;
    if (correctAnswer == answer) {
      score += 1;
    } else {
      print('Wrong');
    }
    changeQuestion();
  }

  changeQuestion() {
    timer.cancel();
    if (currentQues == qz.results.length - 1) {
      print('Quiz Completed');
      print('Score: $score');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: score,
          ),
        ),
      );
    } else {
      setState(() {
        currentQues += 1;
      });
      qz.results[currentQues].incorrectAnswers
          .add(qz.results[currentQues].correctAnswer);
      qz.results[currentQues].incorrectAnswers.shuffle();
      initTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (qz != null) {
      return Scaffold(
        backgroundColor: Color(0xFF242A40),
        body: Expanded(
          child: SingleChildScrollView(
            child: SafeArea(
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
                          style: TextStyle(
                              color: Colors.amberAccent, fontSize: 23),
                        ),
                      ),
                    ),
                    //options
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: Column(
                        children: qz.results[currentQues].incorrectAnswers
                            .map((option) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: RaisedButton(
                              color: Colors.amberAccent,
                              onPressed: () {
                                checkAnswer(option);
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
          ),
        ),
      );
    } else {
      return Scaffold(
          backgroundColor: Color(0xFF242A40),
          body: Expanded(child: Center(child: CircularProgressIndicator())));
    }
  }
}

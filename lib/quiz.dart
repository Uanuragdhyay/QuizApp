import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/question_screen.dart';
import 'package:quizapp/results_screen.dart';
import 'package:quizapp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
    List<String>selectedAnswer=[];
  var activeScreen = 'start-screen';


  // @override
  // void initState() {
  //   activeScreen=StartScreen(switchScreen);
  //   TODO: implement initState
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswer.add(answer);
    if(selectedAnswer.length==questions.length){
      setState(() {

        activeScreen='results-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswer=[];
      activeScreen='questions-screen';
    });
  }
  @override
  Widget build(context) {

    Widget screenWidget =  StartScreen(switchScreen);
   if(activeScreen=='questions-screen'){
     screenWidget=QuestionScreen(onSelectAnswer: chooseAnswer,);
   }
   if(activeScreen=='results-screen'){
     screenWidget=ResultsScreen(chosenAnswers: selectedAnswer, onRestart: restartQuiz);
   }


    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

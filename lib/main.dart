import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final questions = [
    {
      'questionText': 'Weapon of choice?',
      'answers': [
        {'text': 'Bow', 'score': 1},
        {'text': 'Dagger', 'score': 2},
        {'text': 'Sword', 'score': 3},
        {'text': 'Axe', 'score': 4},
        {'text': 'Spell', 'score': 5}
      ]
    },
    {
      'questionText': 'Gameplay mechanics?',
      'answers': [
        {'text': 'Stay out of range', 'score': 1},
        {'text': 'Stealth', 'score': 2},
        {'text': 'Balanced Fight', 'score': 3},
        {'text': 'Brute Force', 'score': 4},
        {'text': 'Cast Magic', 'score': 5},
      ]
    },
    {
      'questionText': 'Preffered assistance?',
      'answers': [
        {'text': 'Binocular', 'score': 1},
        {'text': 'Surpressed Boots', 'score': 2},
        {'text': 'One Handed Shield', 'score': 3},
        {'text': 'Full Armor', 'score': 4},
        {'text': 'Magic Necklace', 'score': 5}
      ]
    },
  ];
  var questIndex = 0;
  var quizCompleted = false;
  var totalScore = 0;
  var classResult = '';

  void answerQuestion(int score) {
    if (questIndex < questions.length - 1) {
      setState(() {
        questIndex = questIndex + 1;
        totalScore = totalScore + score;
      });
    } else {
      setState(() {
        totalScore = totalScore + score;
        questIndex = 0;
        quizCompleted = true;
      });
    }

    calculateClassResult(totalScore);
  }

  void calculateClassResult(int scores) {
    if(scores < 4){
      setState((){
        classResult = 'Ranger';
      });
    }
    else if(scores == 4 || scores < 7){
      setState((){
        classResult = 'Assassin';
      });
    }
    else if(scores == 6 || scores < 10){
      setState((){
        classResult = 'Knight';
      });
    }
    else if(scores == 10 || scores < 13){
      setState((){
        classResult = 'Berserker';
      });
    }
    else if(scores == 13 || scores < 16){
      setState((){
        classResult = 'Mage';
      });
    }
  }

  void resetScore(){
    setState(() {
      questIndex = 0;
      quizCompleted = false;
      totalScore = 0;
      classResult = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            // title: Text('Demo App'),
            ),
        body: !quizCompleted
            ? Quiz(
                answerQuestion: (scr)=> answerQuestion(scr),
                questIndex: questIndex,
                questions: questions,
              )
            : Result(classResult : classResult, resetAction : ()=>resetScore()),
      ),
    );
  }
}

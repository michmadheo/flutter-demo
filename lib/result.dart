import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  // final int totalScore;
  final String classResult;
  final VoidCallback resetAction;

  Result({
    // required this.totalScore,
    required this.classResult,
    required this.resetAction,
    });
    
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: (
        Column(children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text('Your class is', style: TextStyle(fontSize: 20),)),
          Text(classResult, style: TextStyle(fontSize: 25)),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: resetAction, 
              child: Text('Restart')
              ),
          )
        ],)
    ));
  }
}

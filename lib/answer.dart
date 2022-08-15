import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final VoidCallback selectHandler;
  final String title;

  Answer(this.selectHandler, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 30, right: 30),
      child: RaisedButton(
        color: Colors.blue,
        child: Text(title, style: TextStyle(color: Colors.white,)),
        onPressed: selectHandler,
      ),
    );
  }
}

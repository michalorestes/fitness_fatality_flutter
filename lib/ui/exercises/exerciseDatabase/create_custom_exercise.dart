import 'package:flutter/material.dart';

class CreateCustomExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ccreate Exercise"),
        ),
        body: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(20), child: TextField())
          ],
        ),
      ),
    );
  }
}
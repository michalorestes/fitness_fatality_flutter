import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';
import 'package:flutter/material.dart';

class ModalInfo extends StatelessWidget {

  final Exercise exercise;

  ModalInfo(this.exercise);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Primary Muscle Group: "),
              Text(exercise.primaryMuscle),
            ],
          ),
          Row(
            children: <Widget>[
              Text("Secondary Muscle Group: "),
              Text(exercise.secondaryMuscle),
            ],
          )
        ],
      ),
    );
  }
}
import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';
import 'package:flutter/material.dart';

class ModalHeader extends StatelessWidget {

  final Exercise exercise;

  ModalHeader(this.exercise);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(exercise.name),
              Text(exercise.type),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.featured_video),
          onPressed: () {},
        )
      ],
    );
  }
}
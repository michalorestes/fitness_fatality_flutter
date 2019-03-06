import 'package:fitness_fatality_flutter/data/entities/workout.dart';
import 'package:flutter/material.dart';

class WorkoutDetailsPage extends StatelessWidget {
  final Workout _workout;

  WorkoutDetailsPage(this._workout);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_workout.name),
      ),
      body: Center(
        child: Text("Workout details page"),
      ),
    );
  }
}

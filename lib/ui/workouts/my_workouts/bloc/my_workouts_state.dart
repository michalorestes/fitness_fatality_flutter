import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';

class MyWorkoutsState {
  List<Workout> workouts;

  MyWorkoutsState({this.workouts});

  factory MyWorkoutsState.initial() => MyWorkoutsState(workouts: List<Workout>());
}
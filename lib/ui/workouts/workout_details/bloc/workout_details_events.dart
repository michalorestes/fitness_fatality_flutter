import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';

class WorkoutDetailsEvents {}

class OnInitialiseWorkoutDetails extends WorkoutDetailsEvents {
  final Workout workout;

  OnInitialiseWorkoutDetails(this.workout);

}

class OnLoadWorkoutExercises extends WorkoutDetailsEvents {}
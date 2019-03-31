import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout_exercise.dart';

class WorkoutDetailsState {
  final List<WorkoutExercise> exercises;
  final Workout workoutDetails;

  WorkoutDetailsState({this.workoutDetails, this.exercises});

  factory WorkoutDetailsState.initial() => WorkoutDetailsState(
        workoutDetails: Workout(),
        exercises: List(),
      );
}

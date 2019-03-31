import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';

class ExerciseState {
  final List<Exercise> exercises;
  final int workoutId;
  ExerciseState({this.exercises, this.workoutId});

  factory ExerciseState.initial () => ExerciseState(exercises: List(), workoutId: null);
}

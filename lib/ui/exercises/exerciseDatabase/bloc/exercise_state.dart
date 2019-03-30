import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';

class ExerciseState {
  final List<Exercise> exercises;

  ExerciseState({this.exercises});

  factory ExerciseState.initial () => ExerciseState(exercises: List());
}

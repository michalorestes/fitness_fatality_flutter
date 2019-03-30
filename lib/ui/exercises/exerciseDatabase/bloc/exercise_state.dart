import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';
import 'package:fitness_fatality_flutter/data/entities/exercise/muscle_groups.dart';


class ExerciseState {
  final List<Exercise> exercises;

  ExerciseState({this.exercises});

  factory ExerciseState.initial () => ExerciseState(exercises: List());
}

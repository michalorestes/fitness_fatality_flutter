import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';

class ExerciseRepository {
  Future<List<Exercise>> fetchAllExercises() {
    return Exercise.fetchAllExercises();
  } 
}
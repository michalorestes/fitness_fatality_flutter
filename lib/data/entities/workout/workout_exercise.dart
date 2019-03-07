import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';

class WorkoutExercise {
  int id;
  int workoutId;
  Exercise exercise;
  int sequenceId;
  ExerciseLoggingType prefferedLogging;
  Map<String, dynamic> loggingParameters;

  WorkoutExercise(
      {this.id,
      this.workoutId,
      this.exercise,
      this.sequenceId,
      this.prefferedLogging,
      this.loggingParameters});
}

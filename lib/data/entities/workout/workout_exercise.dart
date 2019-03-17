import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';
import 'package:fitness_fatality_flutter/data/entities/logs/exercise_log.dart';
import 'package:fitness_fatality_flutter/data/entities/logs/logging_parameters/logging_parameters_abstract.dart';

class WorkoutExercise {
  int id;
  int workoutId;
  Exercise exercise;
  int sequenceId;
  ExerciseLoggingType prefferedLogging;
  LoggingParametersAbstract loggingParameters;
  List<ExerciseLog> logs = List<ExerciseLog>();

  WorkoutExercise(
      {this.id,
      this.workoutId,
      this.exercise,
      this.sequenceId,
      this.prefferedLogging,
      this.loggingParameters});
}

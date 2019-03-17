import 'package:fitness_fatality_flutter/data/entities/logs/exercise_log.dart';
import 'package:fitness_fatality_flutter/data/entities/logs/logging_parameters/logging_parameters_abstract.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout_exercise.dart';

enum Containers { CONTROLS, TIMER, END }

class BlocState {
  Containers currentContainer;
  final Workout workout;
  final List<WorkoutExercise> exercises;
  final int currentExerciseIndex;
  final int currentSetIndex;
  ExerciseLog currentLog;
  LoggingParametersAbstract currentLogging;

  BlocState({
    this.currentContainer,
    this.workout,
    this.exercises,
    this.currentExerciseIndex,
    this.currentSetIndex,
    this.currentLog,
  }) {
    this.currentLogging = exercises[currentExerciseIndex].loggingParameters;
  }

  factory BlocState.initial(
    Workout workout,
    List<WorkoutExercise> exercises,
  ) =>
      BlocState(
        currentContainer: Containers.CONTROLS,
        workout: workout,
        exercises: exercises,
        currentExerciseIndex: 0,
        currentSetIndex: 1,
        currentLog: ExerciseLog(0, 0.0),
      );

  BlocState clone({
    currentContainer,
    workout,
    exercises,
    currentExerciseIndex,
    currentSetIndex,
    currentLog,
  }) {
    return BlocState(
      currentContainer: currentContainer ?? this.currentContainer,
      workout: workout ?? this.workout,
      exercises: exercises ?? this.exercises,
      currentExerciseIndex: currentExerciseIndex ?? this.currentExerciseIndex,
      currentSetIndex: currentSetIndex ?? this.currentSetIndex,
      currentLog: currentLog ?? this.currentLog,
    );
  }
}

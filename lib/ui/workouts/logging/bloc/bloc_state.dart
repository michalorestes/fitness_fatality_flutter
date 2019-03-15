import 'package:fitness_fatality_flutter/data/entities/workout/logging_parameters/logging_parameters_abstract.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout_exercise.dart';

enum Containers { CONTROLS, TIMER, END }

class BlocState {
  Containers currentContainer;
  final Workout workout;
  final List<WorkoutExercise> exercises;
  final int currentExerciseIndex;
  final int currentSetIndex;
  LoggingParametersAbstract currentLogging;

  BlocState({
    this.currentContainer,
    this.workout,
    this.exercises,
    this.currentExerciseIndex,
    this.currentSetIndex,
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
      );
}

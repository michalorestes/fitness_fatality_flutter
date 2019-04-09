import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout_exercise.dart';

class WorkoutDetailsState {
  final List<WorkoutExercise> exercises;
  final Workout workoutDetails;
  final WorkoutExercise selectedWorkoutExercise;
  final bool isSnackBarDisplayed;

  WorkoutDetailsState({
    this.workoutDetails,
    this.exercises,
    this.selectedWorkoutExercise,
    this.isSnackBarDisplayed,
  });

  factory WorkoutDetailsState.initial() => WorkoutDetailsState(
        workoutDetails: Workout(),
        exercises: List(),
        selectedWorkoutExercise: null,
        isSnackBarDisplayed: false,
      );

  WorkoutDetailsState updateState(WorkoutDetailsState oldState) {
    return WorkoutDetailsState(
      workoutDetails: oldState.workoutDetails ?? this.workoutDetails, 
      exercises: oldState.exercises ?? this.exercises, 
      selectedWorkoutExercise: oldState.selectedWorkoutExercise ?? this.selectedWorkoutExercise,
      isSnackBarDisplayed: oldState.isSnackBarDisplayed ?? this.isSnackBarDisplayed,
    );
  }
}

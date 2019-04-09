import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout_exercise.dart';

class WorkoutDetailsEvents {}

class OnInitialiseWorkoutDetails extends WorkoutDetailsEvents {
  final Workout workout;

  OnInitialiseWorkoutDetails(this.workout);

}

class OnLoadWorkoutExercises extends WorkoutDetailsEvents {}

class OnUpdateWorkoutExercise extends WorkoutDetailsEvents {

  final WorkoutExercise workoutExercise;

  OnUpdateWorkoutExercise({this.workoutExercise});
}

class OnSelectWorkoutExercise extends WorkoutDetailsEvents {

  final WorkoutExercise workoutExercise;

  OnSelectWorkoutExercise({this.workoutExercise});
}

class OnRepsChange extends WorkoutDetailsEvents {
  final int newRepsNumber;
  OnRepsChange(this.newRepsNumber);
}

class OnSetsChange extends WorkoutDetailsEvents {
  final int newSetsNumber;
  OnSetsChange(this.newSetsNumber);
}

class OnRestChange extends WorkoutDetailsEvents {
  final int newRestTime;
  OnRestChange(this.newRestTime);
}
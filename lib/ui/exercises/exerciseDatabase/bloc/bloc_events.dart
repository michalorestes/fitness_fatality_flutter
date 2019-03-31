class BlocEvents {} 

class OnExerciseAddedToWorkout extends BlocEvents {
  final int exerciseId; 

  OnExerciseAddedToWorkout({this.exerciseId});
}

class OnInitialiseExerciseData extends BlocEvents {
  int workoutId; 
  OnInitialiseExerciseData(this.workoutId);
}
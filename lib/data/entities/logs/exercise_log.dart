class ExerciseLog {
  int numberOfReps; 
  double liftedWeight; 

  ExerciseLog(this.numberOfReps, this.liftedWeight) {
    if (numberOfReps < 0) {
      this.numberOfReps = 0; 
    }

    if (liftedWeight < 0) {
      this.liftedWeight = 0.0;
    }
  }
}
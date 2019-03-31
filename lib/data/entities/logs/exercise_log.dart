class ExerciseLog {
  int id;
  int workoutId;
  int numberOfReps;
  double liftedWeight;

  ExerciseLog({
    this.id = -1, 
    this.workoutId,
    this.numberOfReps,
    this.liftedWeight,
  }) {
    if (numberOfReps < 0) {
      this.numberOfReps = 0;
    }

    if (liftedWeight < 0) {
      this.liftedWeight = 0.0;
    }
  }

  Map<String, dynamic> toJson() {
    if(workoutId == null) {
      throw Exception("Workout ID must be provided for ExerciseLog");
    }

    Map<String, dynamic> map = {
      "workoutId": workoutId,
      "numberOfReps": numberOfReps,
      "liftedWeights": liftedWeight
    };

    if (id != null && id > 0) {
      map['id'] = id;
    }

    return map;
  }

  factory ExerciseLog.fromJson(Map<String, dynamic> json) {
    return ExerciseLog(
      id: json['id'],
      workoutId: json['workoutId'],
      numberOfReps: json['numberOfReps'],
      liftedWeight: json['liftedWeight']
    );
  }
}

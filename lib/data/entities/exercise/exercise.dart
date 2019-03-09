import 'package:fitness_fatality_flutter/data/entities/exercise/muscle_groups.dart';

enum ExerciseType { CARDIO, BODY_WEIGHT, WEIGHTS, MACHINES }
enum ExerciseLoggingType { TIME, REPS, DURATION }

class Exercise {
  int id;
  String name;
  ExerciseType exerciseType;
  MuscleGroups muscleGroups;
  bool isCustom;
  List<ExerciseLoggingType> availableLoggingTypes;
  ExerciseLoggingType defaultLoggingType;

  Exercise(
      {this.id,
      this.name,
      this.exerciseType,
      this.muscleGroups,
      this.isCustom,
      this.availableLoggingTypes,
      this.defaultLoggingType});

  String getIconAsset() {
    return "assets/sample_exercise_icon.png";
  }
}

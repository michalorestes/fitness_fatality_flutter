import 'package:fitness_fatality_flutter/data/database/database_provider.dart';

enum ExerciseType { CARDIO, BODY_WEIGHT, WEIGHTS, MACHINES }
enum ExerciseLoggingType { TIME, REPS, DURATION }
enum MuscleGroup {
  QUADRICEPS,
  HAMSTRINGS,
  CALVES,
  CHEST,
  BACK,
  SHOULDERS,
  TRICEPS,
  BICEPS,
  FOREARMS,
  TRAPEZIUS,
  ABS
}

class Exercise {
  int id;
  String name;
  ExerciseType exerciseType;
  MuscleGroup primaryMuscleGroup;
  List<MuscleGroup> secondaryMuscleGroups; 
  bool isCustom;
  List<ExerciseLoggingType> availableLoggingTypes;
  ExerciseLoggingType defaultLoggingType;

  String get type => exerciseType.toString().split(".")[1];

  Exercise(
      {this.id,
      this.name,
      this.exerciseType,
      this.primaryMuscleGroup,
      this.secondaryMuscleGroups,
      this.isCustom,
      this.availableLoggingTypes,
      this.defaultLoggingType});

  String getIconAsset() {
    return "assets/sample_exercise_icon.png";
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "name": name,
      "exerciseType": exerciseType.index,
      "primaryMuscleGroup": primaryMuscleGroup.index,
      "secondaryMuscleGroups": secondaryMuscleGroups.map((dynamic group) => group.index).toList().join(","),
      "isCustom": isCustom,
      "availableLoggingTypes": availableLoggingTypes.map((ExerciseLoggingType type) => type.index).join(","),
      "defaultLoggingType": defaultLoggingType.index
    };

    if (id != null) {
      map['id'] = id;
    }

    return map; 
  }

  static Exercise fromJson(Map<String, dynamic> json) {
    print(json['muscleGroups']);
    return Exercise(
      id: json['id'],
      name: json['name'],
      exerciseType: ExerciseType.values[int.parse(json['exerciseType'])],
      primaryMuscleGroup: MuscleGroup.values[json['primaryMuscleGroup']],
      secondaryMuscleGroups: json['secondaryMuscleGroups'].toString().split(",").map((dynamic group) => MuscleGroup.values[int.parse(group)]).toList(),
      isCustom: json['isCustom'] == 1,
      defaultLoggingType: ExerciseLoggingType.values[int.parse(json['defaultLoggingType'])],
      availableLoggingTypes: json['availableLoggingTypes']
                              .toString()
                              .split(",")
                              .map((dynamic type) => ExerciseLoggingType.values[int.parse(type)])
                              .toList(),
    );
  }

  static Future<List<Exercise>> fetchAllExercises() async {
    final db = await DatabaseProvider.database; 
    var result = await db.rawQuery("SELECT * FROM exercise");
    print(result);
    List<Exercise> data = List(); 
    result.forEach((Map<String, dynamic> row) => data.add(Exercise.fromJson(row))); 
    
    return data; 
  }

  Future<int> save() async {
    final db = await DatabaseProvider.database; 
    var j = this.toJson(); 
    print(j);
    return db.insert("exercise", this.toJson());
  }
}

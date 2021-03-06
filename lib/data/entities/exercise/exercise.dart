import 'package:fitness_fatality_flutter/data/database/database_provider.dart';

enum ExerciseType { CARDIO, BODY_WEIGHT, WEIGHTS, MACHINES }
enum LoggingMethod { TIME, REPS, DURATION }
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
  List<LoggingMethod> availableLoggingTypes;
  LoggingMethod defaultLoggingType;

  String get type => exerciseType.toString().split(".")[1];
  String get primaryMuscle => primaryMuscleGroup.toString().split(".")[1];
  String get secondaryMuscle => secondaryMuscleGroups.map((MuscleGroup mg) => mg.toString().split(".")[1]).toList().join(", ");

  Exercise({
    this.id,
    this.name,
    this.exerciseType,
    this.primaryMuscleGroup,
    this.secondaryMuscleGroups,
    this.isCustom,
    this.availableLoggingTypes,
    this.defaultLoggingType,
  });

  String getIconAsset() {
    return "assets/sample_exercise_icon.png";
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "name": name,
      "exerciseType": exerciseType.index,
      "primaryMuscleGroup": primaryMuscleGroup.index,
      "secondaryMuscleGroups": secondaryMuscleGroups
          .map((dynamic group) => group.index)
          .toList()
          .join(","),
      "isCustom": isCustom,
      "availableLoggingTypes": availableLoggingTypes
          .map((LoggingMethod type) => type.index)
          .join(","),
      "defaultLoggingType": defaultLoggingType.index
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  factory Exercise.fromJson(Map<String, dynamic> json) {
    print(json['muscleGroups']);
    return Exercise(
      id: json['id'],
      name: json['name'],
      exerciseType: ExerciseType.values[int.parse(json['exerciseType'])],
      primaryMuscleGroup: MuscleGroup.values[json['primaryMuscleGroup']],
      secondaryMuscleGroups: json['secondaryMuscleGroups'] != ""
          ? json['secondaryMuscleGroups']
              .toString()
              .split(",")
              .map((dynamic group) => MuscleGroup.values[int.parse(group)])
              .toList()
          : [],
      isCustom: json['isCustom'] == 1,
      defaultLoggingType:
          LoggingMethod.values[int.parse(json['defaultLoggingType'])],
      availableLoggingTypes: json['availableLoggingTypes']
          .toString()
          .split(",")
          .map((dynamic type) => LoggingMethod.values[int.parse(type)])
          .toList(),
    );
  }

  static Future<List<Exercise>> fetchAllExercises() async {
    final db = await DatabaseProvider.database;
    var result = await db.rawQuery("SELECT * FROM exercise");

    List<Exercise> data = List();
    result.forEach(
        (Map<String, dynamic> row) => data.add(Exercise.fromJson(row)));

    return data;
  }

static Future<Exercise> fetchExerciseById(int exerciseId) async {
    final db = await DatabaseProvider.database;
    var result = await db.query("exercise", where: "id = ?", whereArgs: [exerciseId]);

    if(result.length > 0) {
      return Exercise.fromJson(result[0]);
    }

    return null;
  }

  Future<int> save() async {
    final db = await DatabaseProvider.database;
    return db.insert("exercise", this.toJson());
  }
}

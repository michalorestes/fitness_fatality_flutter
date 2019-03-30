import 'dart:io';
import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';
import 'package:fitness_fatality_flutter/data/entities/exercise/muscle_groups.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static Database _database;

  DatabaseProvider._();

  static Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDB();

    return _database;
  }

  static Future<Database> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");

    await deleteDatabase(path);
    Database database = await openDatabase(path, version: 3, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE workout ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "type TEXT,"
          "schedule TEXT"
          ")");

      await db.execute("CREATE TABLE exercise ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "exerciseType TEXT,"
          "primaryMuscleGroup INTEGER,"
          "secondaryMuscleGroups TEXT,"
          "isCustom INTEGER,"
          "availableLoggingTypes TEXT,"
          "defaultLoggingType TEXT"
          ")");
    });

    await database.transaction((Transaction transaction) async {
      Exercise e = Exercise(
        name: "Bench Press",
        isCustom: false,
        defaultLoggingType: ExerciseLoggingType.REPS,
        availableLoggingTypes: [ExerciseLoggingType.REPS],
        exerciseType: ExerciseType.WEIGHTS,
        primaryMuscleGroup: MuscleGroup.CHEST,
        secondaryMuscleGroups: [MuscleGroup.TRICEPS],
      );

      Workout w = Workout(
        name: "Workout A",
        type: WorkoutTypes.WEIGHTS,
        schedule: ["monday"],
      );

      transaction.insert("workout", w.toJson());
      transaction.insert("exercise", e.toJson());
    });

    return database;
  }
}

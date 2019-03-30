import '../../database/database_provider.dart';

enum WorkoutTypes { WEIGHTS, CARDIO }

class Workout {
  int id;
  String name;
  WorkoutTypes type;
  List<String> schedule;

  String get workoutType => type.toString().split(".")[1];

  Workout({
    this.id: -1,
    this.name: "",
    this.type: WorkoutTypes.WEIGHTS,
    this.schedule,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "name": name,
      "type": type.index,
      "schedule": schedule.join(",")
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
      id: json['id'],
      name: json['name'],
      type: WorkoutTypes.values[json['type']],
      schedule: (json['schedule'] as String).split(","));

  Future<int> save() async {
    final db = await DatabaseProvider.database;
    int result = await db.insert("workout", this.toJson());

    return result;
  }

  static Future<List<Workout>> getAllWorkouts() async {
    final db = await DatabaseProvider.database;
    List<Map> res = await db.query("workout");
    List<Workout> data = List();

    res.forEach((f) => {data.add(Workout.fromJson(f))});

    return data;
  }
}

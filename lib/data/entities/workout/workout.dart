//TODO: Switch to using enums once again
class WorkoutTypes {
  static const WEIGHTS = "Weights";
  static const CARDIO = "Cardio";
}

class Workout {
  int id;
  String name;
  String type;
  List<String> schedule;

  Workout(
      {this.id: -1,
      this.name: "",
      this.type: WorkoutTypes.WEIGHTS,
      this.schedule});
}

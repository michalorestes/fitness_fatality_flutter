import 'package:fitness_fatality_flutter/data/entities/enums/workout_types_enum.dart';

class Workout 
{
  int id = -1; 
  String name = ""; 
  WorkoutTypes type = WorkoutTypes.Weights; 
  List<String> schedule = [];

  Workout({this.id, this.name, this.type, this.schedule});
}
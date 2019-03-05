import 'package:fitness_fatality_flutter/data/entities/enums/workout_types_enum.dart';
import 'package:fitness_fatality_flutter/data/entities/workout.dart';
import 'package:fitness_fatality_flutter/utils/routing/routing.dart';
import 'package:fitness_fatality_flutter/widgets/workout_list_tile.dart';

import 'package:flutter/material.dart';

class WorkoutsPage extends StatelessWidget {
  final List<Workout> _workouts = [
    Workout(name: "Workout A", type: WorkoutTypes.Weights),
    Workout(name: "Workout B", type: WorkoutTypes.Weights),
    Workout(name: "Workout c", type: WorkoutTypes.Cardio)
  ];

  WorkoutsPage() {
    for (int i = 0; i < 30; i++) {
      _workouts.add(Workout(name: "Workout A", type: WorkoutTypes.Weights));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Fitness Fatality"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Routing
          .navigate<String>(context, Routes.ADD_NEW_WORKOUT)
          .then((String v){
            print(v);
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _workouts.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildListItem(_workouts[index], index);
        },
      ),
    );
  }

  Widget _buildListItem(Workout workout, int index) {
    print(_workouts.length <= index);
    return Padding(
      padding: EdgeInsets.only(bottom: 32 == index ? 72 : 0),
      child: WorkoutListTile(
        name: workout.name,
        type: workout.type.toString(),
        icon: "assets/weights_workout_icon.png",
        onTap: () {},
        onChipTap: () {},
      ),
    );
  }
}

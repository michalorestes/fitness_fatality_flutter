import 'package:fitness_fatality_flutter/data/entities/workout.dart';
import 'package:fitness_fatality_flutter/utils/routing/routing.dart';
import 'package:fitness_fatality_flutter/widgets/workout_list_tile.dart';

import 'package:flutter/material.dart';

class WorkoutsPage extends StatefulWidget {
  @override
  State<WorkoutsPage> createState() {
    return WorkoutsPageState();
  }
}

class WorkoutsPageState extends State<WorkoutsPage> {
  final List<Workout> _workouts = [
    Workout(name: "Workout A", type: WorkoutTypes.WEIGHTS),
    Workout(name: "Workout B", type: WorkoutTypes.WEIGHTS),
    Workout(name: "Workout c", type: WorkoutTypes.CARDIO),
    Workout(name: "Workout c", type: WorkoutTypes.CARDIO)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Fitness Fatality"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Routing.navigate<Workout>(context, Routes.ADD_NEW_WORKOUT)
              .then((Workout workout) {
            if (workout == null) {
              return;
            }
            setState(() {
              print(workout.type.toString());
              _workouts.add(workout);
            });
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
    String imageAsset = "assets/weights_workout_icon.png";
    if (workout.type == WorkoutTypes.CARDIO) {
      imageAsset = "assets/cardio_workout_icon.png";
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 32 == index ? 72 : 0),
      child: WorkoutListTile(
        name: workout.name,
        type: workout.type,
        icon: imageAsset,
        onTap: () {},
        onChipTap: () {},
      ),
    );
  }
}

import 'package:fitness_fatality_flutter/data/entities/enums/workout_types_enum.dart';
import 'package:fitness_fatality_flutter/data/entities/workout.dart';
import 'package:flutter/material.dart';

class AddWorkoutPage extends StatefulWidget {
  final Workout _createdWorkout =
      Workout(name: "nn", type: WorkoutTypes.Weights, schedule: []);

  @override
  State<StatefulWidget> createState() => _AddWorkoutPageState();
}

class _AddWorkoutPageState extends State<AddWorkoutPage> {
  static const double _sectionPadding = 16.0;
  static const double _sectionTitleSpacing = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Create Workout"),
      leading: IconButton(
        icon: Icon(Icons.clear),
        tooltip: "Cancel",
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.check),
          tooltip: "Save workout",
          onPressed: () {
            Navigator.pop<String>(context, "hello");
          },
        )
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildWorkoutNameSection(),
          _buildWorkoutTypeSection(),
          _buildDaysFilterChips(),
        ],
      ),
    );
  }

  Widget _buildWorkoutNameSection() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: _sectionPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            onChanged: (String value) {
              widget._createdWorkout.name = value;
            },
            decoration: InputDecoration(
              hintText: "Workout Name",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutTypeSection() {
    List<WorkoutTypes> types = [WorkoutTypes.Weights, WorkoutTypes.Cardio];
    List<Widget> widgets = [];

    widgets.add(Text("Chose workout type:"));
    widgets.add(SizedBox(height: _sectionTitleSpacing));

    types.forEach((WorkoutTypes workoutType) => {
          widgets.add(RadioListTile<WorkoutTypes>(
            title: Text(workoutType.toString()),
            groupValue: widget._createdWorkout.type,
            value: workoutType,
            onChanged: (WorkoutTypes value) {
              setState(() {
                widget._createdWorkout.type = value;
              });
            },
          ))
        });

    return Padding(
      padding:
          const EdgeInsets.only(top: _sectionPadding, bottom: _sectionPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ),
    );
  }

  Widget _buildDaysFilterChips() {
    List<String> days = [
      "Monday",
      "Tuesday",
      "Wednsday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];
    List<Widget> chips = [];

    days.forEach((v) {
      chips.add(FilterChip(
        label: Text(v),
        selected: widget._createdWorkout.schedule.contains(v),
        onSelected: (bool isSelected) {
          setState(() {
            if (isSelected) {
              widget._createdWorkout.schedule.add(v);
            } else {
              widget._createdWorkout.schedule
                  .removeWhere((String element) => element == v);
            }
          });
        },
      ));
    });

    return Padding(
      padding:
          const EdgeInsets.only(top: _sectionPadding, bottom: _sectionPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Chose workout schedule:"),
          SizedBox(height: _sectionTitleSpacing),
          Padding(padding: EdgeInsets.symmetric(vertical: 8.0), child: Wrap(spacing: 4, children: chips)),
        ],
      ),
    );
  }
}

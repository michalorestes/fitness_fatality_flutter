import 'package:fitness_fatality_flutter/ui/workouts/workout_details/bloc/workout_details_bloc.dart';
import 'package:fitness_fatality_flutter/ui/workouts/workout_details/bloc/workout_details_events.dart';
import 'package:fitness_fatality_flutter/ui/workouts/workout_details/bloc/workout_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModalControls extends StatefulWidget {
  String dropdownValue = 'Reps';
  int sliderReps = 0;
  int sliderSets = 0;
  int sliderRest = 0;

  @override
  __ModalControlsState createState() => __ModalControlsState();
}

class __ModalControlsState extends State<ModalControls> {
  WorkoutDetailsBloc bloc;

  @override
  Widget build(BuildContext context) {
    if (bloc == null) {
      bloc = BlocProvider.of<WorkoutDetailsBloc>(context);
    }

    return BlocBuilder(
      bloc: bloc,
      builder: (BuildContext context, WorkoutDetailsState state) {
        return Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _buildDropDown(),
              _buildControls(state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDropDown() {
    return DropdownButton<String>(
      isExpanded: true,
      value: widget.dropdownValue,
      onChanged: (String newValue) {
        setState(() {
          widget.dropdownValue = newValue;
        });
      },
      items: <String>['Reps', 'Time', 'Duration']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildControls(WorkoutDetailsState state) {
    return Column(
      children: <Widget>[
        Text(
            "Reps: ${state.selectedWorkoutExercise.loggingTarget.parametersMap['reps']}"),
        Slider(
          min: 0,
          max: 30,
          value: state
              .selectedWorkoutExercise.loggingTarget.parametersMap['reps']
              .toDouble(),
          onChanged: (double newRepsNumber) {
            setState(() {
              bloc.dispatch(OnRepsChange(newRepsNumber));
            });
          },
        ),
        Text("Sets: ${widget.sliderSets}"),
        Slider(
          min: 0,
          max: 20,
          value: widget.sliderSets.toDouble(),
          onChanged: (double d) {
            setState(() {
              widget.sliderSets = d.toInt();
            });
          },
        ),
        Text("Rest Duration: ${widget.sliderRest}s"),
        Slider(
          min: 0,
          max: 120,
          value: widget.sliderRest.toDouble(),
          onChanged: (double d) {
            setState(() {
              widget.sliderRest = d.toInt();
            });
          },
        ),
        ButtonTheme(
          minWidth: double.infinity,
          textTheme: ButtonTextTheme.primary,
          child: RaisedButton(
            onPressed: () {
              bloc.dispatch(OnUpdateWorkoutExercise(
                  workoutExercise: state.selectedWorkoutExercise,),);
                  Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        )
      ],
    );
  }
}

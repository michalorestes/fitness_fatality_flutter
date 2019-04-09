import 'package:fitness_fatality_flutter/data/entities/workout/workout_exercise.dart';
import 'package:fitness_fatality_flutter/ui/workouts/workout_details/bloc/workout_details_bloc.dart';
import 'package:fitness_fatality_flutter/ui/workouts/workout_details/bloc/workout_details_state.dart';
import 'package:fitness_fatality_flutter/ui/workouts/workout_details/widgets/modals/workout_exercise_modal/modal_controls.dart';
import 'package:fitness_fatality_flutter/ui/workouts/workout_details/widgets/modals/workout_exercise_modal/modal_header.dart';
import 'package:fitness_fatality_flutter/ui/workouts/workout_details/widgets/modals/workout_exercise_modal/modal_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseInfoModal extends StatefulWidget {
  ExerciseInfoModal();

  @override
  ExerciseInfoModalState createState() => ExerciseInfoModalState();
}

class ExerciseInfoModalState extends State<ExerciseInfoModal> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<WorkoutDetailsBloc>(context),
      builder: (BuildContext context, WorkoutDetailsState state) {
        return Container(
          height: 10000,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ModalHeader(state.selectedWorkoutExercise.exercise),
              ModalInfo(state.selectedWorkoutExercise.exercise),
              ModalControls(),
            ],
          ),
        );
      },
    );
  }
}

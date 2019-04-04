import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout_exercise.dart';
import 'package:fitness_fatality_flutter/ui/workouts/workout_details/widgets/modals/workout_exercise_modal/modal_controls.dart';
import 'package:fitness_fatality_flutter/ui/workouts/workout_details/widgets/modals/workout_exercise_modal/modal_header.dart';
import 'package:fitness_fatality_flutter/ui/workouts/workout_details/widgets/modals/workout_exercise_modal/modal_info.dart';
import 'package:flutter/material.dart';

class ExerciseInfoModal extends StatefulWidget {
  final WorkoutExercise exercise;


  ExerciseInfoModal(this.exercise);

  @override
  ExerciseInfoModalState createState() => ExerciseInfoModalState();
}

class ExerciseInfoModalState extends State<ExerciseInfoModal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ModalHeader(widget.exercise.exercise),
        ModalInfo(widget.exercise.exercise),
        ModalControls(),
      ],
    );
  }
}





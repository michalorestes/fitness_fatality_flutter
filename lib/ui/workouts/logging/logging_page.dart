import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/logging_parameters/logging_parameters_abstract.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/logging_parameters/reps_logging.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout_exercise.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/completed_exercises_container.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/controls_container.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/timer_container.dart';
import 'package:flutter/material.dart';

enum Container { CONTROLS, TIMER }

class LoggingPage extends StatefulWidget {
  Container currentContainer = Container.CONTROLS;
  Workout workout;
  List<WorkoutExercise> exercises;

  int currentExerciseIndex = 0;
  int currentSetIndex = 1;
  LoggingParametersAbstract loggingParameters; 
  Map<String, dynamic> logs = Map<String, dynamic>(); 

  LoggingPage({this.workout, this.exercises}) {
    loggingParameters = exercises[currentExerciseIndex].loggingParameters;
  }

  @override
  State<LoggingPage> createState() {
    return LoggingPageState();
  }
}

class LoggingPageState extends State<LoggingPage> {

  Widget containerWidget; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          _getContainer(),
          Expanded(child: CompletedExercisesContainer()),
        ],
      ),
    );
  }

  Widget _getContainer() {
    WorkoutExercise workoutExercise =
        widget.exercises[widget.currentExerciseIndex];
    
    if (widget.currentContainer == Container.CONTROLS) {
      containerWidget = ControlsContainer(
        exerciseName: workoutExercise.exercise.name,
        setNumber: widget.currentSetIndex,
        onNextPress: _onControlsNextPress,
      );
    } else {
      containerWidget = TimerContainer(
        onNextPress: _onTimerNextPress,
      );
    }

    return Expanded(child: containerWidget);
  }

  void _onTimerNextPress() {
    setState(() {
      widget.currentContainer = Container.CONTROLS;
    });
  }

  void _onControlsNextPress() {
    setState(() {
      widget.currentContainer = Container.TIMER;
      RepsLogging logging = 
        widget
          .exercises[widget.currentExerciseIndex]
          .loggingParameters;

      if (widget.currentSetIndex < logging.getParameters()['sets']) {
        widget.currentSetIndex++;
      } else if (widget.currentExerciseIndex < widget.exercises.length - 1) {
        widget.currentSetIndex = 1;
        widget.currentExerciseIndex++;
      } else {
        //TODO: Reached end of session. Finalise workout
        print("Reached end of session. Finalise workout");
      }
    });
  }
}

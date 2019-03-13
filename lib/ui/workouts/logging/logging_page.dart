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
  Map<String, dynamic> logs = Map<String, dynamic>();

  LoggingPage({this.workout, this.exercises});

  @override
  State<LoggingPage> createState() {
    return LoggingPageState();
  }
}

class LoggingPageState extends State<LoggingPage> {
  Widget containerWidget;
  WorkoutExercise currentExercise;
  LoggingParametersAbstract currentLogging;

  void _initProperties() {
    if (_isNextExerciseAvailable() || _isOneExerciseOnly()) {
      _setCurrentExerciseDetails();
    }
  }

  @override
  Widget build(BuildContext context) {
    _initProperties();

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
    if (_isWorkoutComplete()) {
      containerWidget = Text("Workout Complete! Congrats!");
    } else if (widget.currentContainer == Container.CONTROLS) {
      containerWidget = ControlsContainer(
        exerciseName: currentExercise.exercise.name,
        setNumber: widget.currentSetIndex,
        onNextPress: _onControlsNextPress,
      );
    } else if (widget.currentContainer == Container.TIMER) {
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

      if (_isNextSetAvailable()) {
        _startNextSet();
      } else if (_isNextExerciseAvailable()) {
        _startNextExercise();
      }
    });
  }

  void _setCurrentExerciseDetails() {
    currentExercise = widget.exercises[widget.currentExerciseIndex];
    currentLogging = currentExercise.loggingParameters;
  }

  void _startNextSet() {
    widget.currentSetIndex++;
  }

  void _startNextExercise() {
    _resetSetsCount();
    widget.currentExerciseIndex++;
  }

  void _resetSetsCount() {
    widget.currentSetIndex = 1;
  }

  bool _isWorkoutComplete() {
    return (widget.currentExerciseIndex > widget.exercises.length - 1);
  }

  bool _isNextSetAvailable() {
    return (widget.currentSetIndex < currentLogging.getParameters()['sets']);
  }

  bool _isNextExerciseAvailable() {
    return (widget.currentExerciseIndex <= widget.exercises.length - 1);
  }

  bool _isOneExerciseOnly() {
    return (widget.exercises.length == 1 && widget.currentExerciseIndex == 0);
  }
}

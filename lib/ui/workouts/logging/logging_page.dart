import 'package:fitness_fatality_flutter/data/entities/workout/logging_parameters/logging_parameters_abstract.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout_exercise.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/bloc/bloc_component.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/bloc/bloc_state.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/containers/controls_container.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/containers/timer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoggingPage extends StatefulWidget {
  final Workout workout;
  final List<WorkoutExercise> exercises;

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

  BlocComponent _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocComponent(widget.workout, widget.exercises);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: BlocBuilder(
          bloc: _bloc,
          builder: (BuildContext context, BlocState state) {
            return Flex(
              direction: Axis.vertical,
              children: <Widget>[
                _getContainer(),
                // Expanded(child: CompletedExercisesContainer()),
                Expanded(child: Text("Press")),
              ],
            );
          },
        ));
  }

  Widget _getContainer() {
    Widget containerWidget;
    int exerciseIndex = _bloc.currentState.currentExerciseIndex;

    String exerciseName =
        _bloc.currentState.exercises[exerciseIndex].exercise.name;

    switch (_bloc.currentState.currentContainer) {
      case Containers.END:
        containerWidget = Text("Completed CONGRATS!");
        break;
      case Containers.CONTROLS:
        containerWidget = ControlsContainer(
          exerciseName: exerciseName,
          setNumber: _bloc.currentState.currentSetIndex,
          onNextPress: () => _bloc.dispatch(BlocEvents.NextEvent),
        );
        break;
      case Containers.TIMER:
        containerWidget = TimerContainer(
          onNextPress: () => _bloc.dispatch(BlocEvents.NextEvent),
        );
        break;
      default:
    }

    return Expanded(child: containerWidget);
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}

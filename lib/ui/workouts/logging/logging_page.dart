import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/completed_exercises_container.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/timer_container.dart';
import 'package:flutter/material.dart';

class LoggingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logging"),
        elevation: 0,
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          // ControlsContainer(),
          Expanded(
            child: TimerContainer(),
          ),
          Expanded(
            child: CompletedExercisesContainer(),
          ),
        ],
      ),
    );
  }
}

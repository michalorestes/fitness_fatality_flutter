import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/completed_exercises_container.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/controls_container.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/timer_container.dart';
import 'package:flutter/material.dart';

enum Container { CONTROLS, TIMER }

class LoggingPage extends StatefulWidget {
  Container currentContainer = Container.CONTROLS;

  @override
  State<LoggingPage> createState() {
    return LoggingPageState();
  }
}

class LoggingPageState extends State<LoggingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logging your workout"),
        elevation: 0,
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          // ControlsContainer(),
          Expanded(
            child: _getControlsContainer(),
          ),
          Expanded(
            child: CompletedExercisesContainer(),
          ),
        ],
      ),
    );
  }

  Widget _getControlsContainer() {
    print(widget.currentContainer);
    
      if (widget.currentContainer == Container.CONTROLS) {
        return ControlsContainer(
          onNextPress: _onControlsNextPress,
        );
      } else if (widget.currentContainer == Container.TIMER) {
        return TimerContainer(
          onNextPress: _onTimerNextPress,
        );
      
      }

    return TimerContainer();
  }

  void _onTimerNextPress() {
    setState(() {
    widget.currentContainer = Container.CONTROLS;  
    });
    
  }

  void _onControlsNextPress() {
    setState(() {
     widget.currentContainer = Container.TIMER; 
    });
  }
}

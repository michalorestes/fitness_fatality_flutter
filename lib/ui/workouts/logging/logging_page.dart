import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/controls_container.dart';
import 'package:flutter/material.dart';

class LoggingPage extends StatelessWidget {  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logging"),
        elevation: 0,
      ),
      body: Center(
        child: ControlsContainer()
      ),
    );
  }
}

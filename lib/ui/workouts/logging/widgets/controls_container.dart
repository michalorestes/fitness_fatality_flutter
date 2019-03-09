import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/sets_value_picker_widget.dart';
import 'package:flutter/material.dart';

class ControlsContainer extends StatefulWidget {
  @override
  State<ControlsContainer> createState() {
    return ControlsContainerState();
  }
}

class ControlsContainerState extends State<ControlsContainer> {
  double weightValue;

  @override
  void initState() {
    super.initState();
    weightValue = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("BENCH PRESS"),
        Text("SET 1"),
        SetsValuePickerWidget(
          value: weightValue,
          label: "weight",
          onAddPress: onAddWeightPressed,
          onRemovePress: onRemoveWeightPressed,
        ),
      ],
    );
  }

  void onAddWeightPressed() {
    setState(() {
      weightValue += 0.5;
    });
  }

  void onRemoveWeightPressed() {
    if (weightValue > 0) {
      setState(() {
        weightValue -= .5;
      });
    }
  }
}

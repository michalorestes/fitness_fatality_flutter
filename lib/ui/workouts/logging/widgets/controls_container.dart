import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/value_picker.dart';
import 'package:flutter/material.dart';

class ControlsContainer extends StatefulWidget {
  @override
  State<ControlsContainer> createState() {
    return ControlsContainerState();
  }
}

class ControlsContainerState extends State<ControlsContainer> {
  double weightValue;
  int setsValue; 

  @override
  void initState() {
    super.initState();
    weightValue = 0.0;
    setsValue = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("BENCH PRESS"),
        Text("SET 1"),
        ValuePicker(
          value: weightValue,
          label: "weight",
          appendLabelToValue: " kg",
          onAddPress: onAddWeightPressed,
          onRemovePress: onRemoveWeightPressed,
          color: Color(0xFF2F6FCF),
        ),
        SizedBox(height: 16,),
        ValuePicker(
          value: setsValue.toDouble(),
          label: "sets",
          onAddPress: onAddSetsPressed,
          onRemovePress: onRemoveSetsPressed,
          color: Color(0xFF2F6FCF),
          isValueInt: true,
        )
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

  void onAddSetsPressed() {
    setState(() {
      setsValue += 1;
    });
  }

  void onRemoveSetsPressed() {
    if (setsValue > 0) {
      setState(() {
        setsValue -= 1;
      });
    }
  }
}

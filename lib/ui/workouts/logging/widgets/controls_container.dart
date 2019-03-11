import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/logging_label.dart';
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
  int elevation;

  @override
  void initState() {
    super.initState();
    weightValue = 0.0;
    setsValue = 0;
    elevation = 6;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2F6FCF),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          LoggingLabel(
            text: "BENCH PRESS",
          ),
          LoggingLabel(
            text: "SET 1",
            fontSize: 26,
          ),
          ValuePicker(
            value: weightValue,
            label: "weight",
            appendLabelToValue: " kg",
            onAddPress: onAddWeightPressed,
            onRemovePress: onRemoveWeightPressed,
            color: Color(0x33FFFFFF),
          ),
          SizedBox(
            height: 16,
          ),
          ValuePicker(
            value: setsValue.toDouble(),
            label: "sets",
            onAddPress: onAddSetsPressed,
            onRemovePress: onRemoveSetsPressed,
            color: Color(0x33FFFFFF),
            isValueInt: true,
          ),
          _buildButtonBar(),
        ],
      ),
    );
  }

  ButtonBar _buildButtonBar() {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        MaterialButton(
          child: Text(
            "DONE",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
        ),
        MaterialButton(
          child: Text(
            "60s rest",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
        ),
        MaterialButton(
          child: Text(
            "NEXT",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
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

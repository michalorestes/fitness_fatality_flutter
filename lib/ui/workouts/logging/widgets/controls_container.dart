import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/logging_label.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/value_picker.dart';
import 'package:flutter/material.dart';

class ControlsContainer extends StatefulWidget {
  final String exerciseName;
  final int setNumber;
  final double startingWeight;
  final int startingReps;
  final Function onNextPress;

  ControlsContainer(
      {this.onNextPress,
      this.exerciseName = "",
      this.setNumber = 1,
      this.startingWeight = 0.0,
      this.startingReps = 0});

  @override
  State<ControlsContainer> createState() {
    return ControlsContainerState();
  }
}

class ControlsContainerState extends State<ControlsContainer> {
  double weightValue;
  int repsValue;
  int elevation;

  @override
  void initState() {
    super.initState();
    weightValue = widget.startingWeight;
    repsValue = widget.startingReps;
    elevation = 6;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2F6FCF),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          LoggingLabel(
            text: widget.exerciseName,
          ),
          LoggingLabel(
            text: "SET " + widget.setNumber.toString(),
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
            value: repsValue.toDouble(),
            label: "reps",
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
          onPressed: widget.onNextPress,
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
      repsValue += 1;
    });
  }

  void onRemoveSetsPressed() {
    if (repsValue > 0) {
      setState(() {
        repsValue -= 1;
      });
    }
  }
}

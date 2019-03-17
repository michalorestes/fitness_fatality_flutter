import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/logging_label.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/value_picker.dart';
import 'package:flutter/material.dart';

class ControlsContainer extends StatefulWidget {
  final String exerciseName;
  final int setNumber;
  final double weightPickerValue;
  final int repsPickerValue;
  final Function onNextPress;
  final Function onRepsIncrement;
  final Function onRepsDecrement;
  final Function onWeightIncrement;
  final Function onWeightDecrement;

  ControlsContainer({
    this.onNextPress,
    this.exerciseName = "",
    this.setNumber = 1,
    this.weightPickerValue = 0.0,
    this.repsPickerValue = 0,
    this.onRepsIncrement,
    this.onRepsDecrement,
    this.onWeightIncrement,
    this.onWeightDecrement,
  });

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
    weightValue = widget.weightPickerValue;
    repsValue = widget.repsPickerValue;
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
            value: widget.weightPickerValue,
            label: "weight",
            appendLabelToValue: " kg",
            onAddPress: widget.onWeightIncrement,
            onRemovePress: widget.onWeightDecrement,
            color: Color(0x33FFFFFF),
          ),
          SizedBox(
            height: 16,
          ),
          ValuePicker(
            value: widget.repsPickerValue.toDouble(),
            label: "reps",
            onAddPress: widget.onRepsIncrement,
            onRemovePress: widget.onRepsDecrement,
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
}

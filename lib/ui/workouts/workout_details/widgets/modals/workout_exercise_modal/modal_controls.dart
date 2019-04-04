import 'package:flutter/material.dart';


class ModalControls extends StatefulWidget {
  String dropdownValue = 'Reps';
  int sliderReps = 0;
  int sliderSets = 0;
  int sliderRest = 0;

  @override
  __ModalControlsState createState() => __ModalControlsState();
}

class __ModalControlsState extends State<ModalControls> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildDropDown(),
          _buildControls(),
        ],
      ),
    );
  }

  Widget _buildDropDown() {
    return DropdownButton<String>(
      isExpanded: true,
      value: widget.dropdownValue,
      onChanged: (String newValue) {
        setState(() {
          widget.dropdownValue = newValue;
        });
      },
      items: <String>['Reps', 'Time', 'Duration']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildControls() {
    return Column(
      children: <Widget>[
        Text("Reps: ${widget.sliderReps}"),
        Slider(
          min: 0,
          max: 30,
          value: widget.sliderReps.toDouble(),
          onChanged: (double d) {
            setState(() {
              widget.sliderReps = d.toInt();
            });
          },
        ),
        Text("Sets: ${widget.sliderSets}"),
        Slider(
          min: 0,
          max: 20,
          value: widget.sliderSets.toDouble(),
          onChanged: (double d) {
            setState(() {
              widget.sliderSets = d.toInt();
            });
          },
        ),
        Text("Rest Duration: ${widget.sliderRest}s"),
        Slider(
          min: 0,
          max: 120,
          value: widget.sliderRest.toDouble(),
          onChanged: (double d) {
            setState(() {
              widget.sliderRest = d.toInt();
            });
          },
        ),
      ],
    );
  }
}
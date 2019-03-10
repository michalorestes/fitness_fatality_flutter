import 'package:flutter/material.dart';

class ValuePicker extends StatelessWidget {
  final double value;  
  final String label;
  final Function onAddPress; 
  final Function onRemovePress; 
  final Color color; 
  final String appendLabelToValue;
  final bool isValueInt; 

  ValuePicker({
    this.value = 0.0, 
    this.label = "", 
    this.onAddPress, 
    this.onRemovePress,
    this.color = Colors.blue,
    this.appendLabelToValue,
    this.isValueInt = false
  });

  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ControlButton(
              icon: Icons.remove_circle_outline,
              onPress: onRemovePress,
            ),
            ControlLabels(
              value: _getControlsLabel(),
              label: label,
            ),
            ControlButton(
              icon: Icons.add_circle_outline,
              onPress: onAddPress,
            ),
          ],
        ),
      ),
    );
  }

  String _getControlsLabel() {
    String controlValue;
    if (isValueInt) {
      controlValue = value.toInt().toString();
    } else {
      controlValue =value.toString();
    }

    return (appendLabelToValue != null) ? controlValue + appendLabelToValue : controlValue;
  }
}

class ControlButton extends StatelessWidget {
  final IconData icon;
  final double controlSize;
  final double iconSize;
  final Function onPress;

  ControlButton(
      {this.icon, this.controlSize = 32, this.iconSize = 26, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: controlSize,
      width: controlSize,
      child: RawMaterialButton(
        shape: CircleBorder(),
        child: Icon(
          icon,
          color: Colors.white,
          size: iconSize,
        ),
        onPressed: onPress,
      ),
    );
  }
}

class ControlLabels extends StatelessWidget {
  final String value;
  final String label;

  ControlLabels({this.value = "", this.label = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          this.value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          this.label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

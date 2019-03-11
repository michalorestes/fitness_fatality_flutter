import 'package:flutter/material.dart';

class ValuePicker extends StatelessWidget {
  final double value;
  final String label;
  final Function onAddPress;
  final Function onRemovePress;
  final Color color;
  final String appendLabelToValue;
  final bool isValueInt;

  ValuePicker(
      {this.value = 0.0,
      this.label = "",
      this.onAddPress,
      this.onRemovePress,
      this.color = Colors.blue,
      this.appendLabelToValue,
      this.isValueInt = false});

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
            PickerButton(
              icon: Icons.remove_circle_outline,
              onPress: onRemovePress,
            ),
            PickerLabels(
              value: _getControlsLabel(),
              label: label,
            ),
            PickerButton(
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
      controlValue = value.toString();
    }

    return (appendLabelToValue != null)
        ? controlValue + appendLabelToValue
        : controlValue;
  }
}

class PickerButton extends StatelessWidget {
  final IconData icon;
  final double controlSize;
  final double iconSize;
  final Function onPress;

  PickerButton(
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

class PickerLabels extends StatelessWidget {
  final String value;
  final String label;

  PickerLabels({this.value = "", this.label = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildText(this.value, 16),
        _buildText(this.label, 10),
      ],
    );
  }

  Text _buildText(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
      ),
    );
  }
}

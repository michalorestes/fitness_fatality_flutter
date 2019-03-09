import 'package:flutter/material.dart';

class SetsValuePickerWidget extends StatelessWidget {
  final double value;  
  final String label;
  final Function onAddPress; 
  final Function onRemovePress; 

  SetsValuePickerWidget({
    this.value = 0.0, 
    this.label = "", 
    this.onAddPress, 
    this.onRemovePress
  });

  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.blue,
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
              value: value.toString() + " kg",
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
}

class ControlButton extends StatelessWidget {
  final IconData icon;
  final double controlSize;
  final double iconSize;
  final Function onPress;

  ControlButton(
      {this.icon, this.controlSize = 22, this.iconSize = 16, this.onPress});

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
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          this.label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 8,
          ),
        ),
      ],
    );
  }
}

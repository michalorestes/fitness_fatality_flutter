import 'package:flutter/material.dart';

class LoggingLabel extends StatelessWidget {
  final String text;
  final double padding;
  final double fontSize;
  final Color fontColor;

  LoggingLabel(
      {this.text,
      this.padding = 20,
      this.fontSize = 32,
      this.fontColor = const Color(0x99FFFFFF)});

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Text(
        text,
        style: TextStyle(
            color: fontColor, fontWeight: FontWeight.bold, fontSize: fontSize),
      ),
    );
  }
}

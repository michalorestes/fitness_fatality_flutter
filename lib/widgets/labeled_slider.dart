import 'package:flutter/material.dart';

class LabeledSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LabeledSliderState();
  }
}

class LabeledSliderState extends State<LabeledSlider> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("Sets: $value"),
          Slider(
            min: 0,
            max: 100,
            value: value.toDouble(),
            onChanged: (double value) {
              setState(() {
                this.value = value.toInt();
              });
            },
          )
        ],
      ),
    );
  }
}

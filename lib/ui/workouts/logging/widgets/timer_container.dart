import 'package:fitness_fatality_flutter/ui/workouts/logging/widgets/logging_label.dart';
import 'package:flutter/material.dart';

class TimerContainer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          LoggingLabel(
            text: "REST",
          ),
          LoggingLabel(
            text: "20:99",
            fontSize: 62,
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
}

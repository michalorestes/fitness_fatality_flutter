import 'package:flutter/material.dart';

class CompletedExercisesContainer extends StatelessWidget {

  final List<String> dummyValues = [
    "Set 1",
    "Set 2",
    "Set 3",
    "Set 4",
    "Set 5",
    "Set 6",
    "Set 7",
    "Set 8",
    "Set 9",
    "Set 10",
  ];

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyValues.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(dummyValues[index]),
          trailing: Icon(Icons.expand_more),
          onTap: (){},
        );
      },
    );
  }
} 
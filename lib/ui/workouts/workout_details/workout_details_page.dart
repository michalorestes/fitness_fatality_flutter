import 'package:fitness_fatality_flutter/data/entities/exercise.dart';
import 'package:fitness_fatality_flutter/data/entities/workout.dart';
import 'package:flutter/material.dart';

class WorkoutDetailsPage extends StatelessWidget {
  Workout _workout = Workout();

  final List<Exercise> exercises = [
    Exercise(name: "Push Ups"),
    Exercise(name: "Bench press"),
    Exercise(name: "Pull ups"),
    Exercise(name: "Press ups"),
    Exercise(name: "Crunches"),
    Exercise(name: "Sit ups"),
    Exercise(name: "BIceps curl"),
    Exercise(name: "Something else"),
    Exercise(name: "Push Ups"),
    Exercise(name: "Bench press"),
    Exercise(name: "Pull ups"),
    Exercise(name: "Press ups"),
    Exercise(name: "Crunches"),
    Exercise(name: "Sit ups"),
    Exercise(name: "BIceps curl"),
    Exercise(name: "Something else"),
    Exercise(name: "Push Ups"),
    Exercise(name: "Bench press"),
    Exercise(name: "Pull ups"),
    Exercise(name: "Press ups"),
    Exercise(name: "Crunches"),
    Exercise(name: "Sit ups"),
    Exercise(name: "BIceps curl"),
    Exercise(name: "Something else"),
    Exercise(name: "Push Ups"),
    Exercise(name: "Bench press"),
    Exercise(name: "Pull ups"),
    Exercise(name: "Press ups"),
    Exercise(name: "Crunches"),
    Exercise(name: "Sit ups"),
    Exercise(name: "BIceps curl"),
    Exercise(name: "Something else"),
    Exercise(name: "Push Ups"),
    Exercise(name: "Bench press"),
    Exercise(name: "Pull ups"),
    Exercise(name: "Press ups"),
    Exercise(name: "Crunches"),
    Exercise(name: "Sit ups"),
    Exercise(name: "BIceps curl"),
    Exercise(name: "Something else"),
  ];

  WorkoutDetailsPage(this._workout);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        elevation: 12,
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        shape: CircularNotchedRectangle(),
        color: Colors.blue,
        child: Container(
          height: 50,
          child: Row(
            children: <Widget>[Text("data")],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150,
            pinned: true,
            floating: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(_workout.name),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(buildSliverListItem,
                childCount: exercises.length),
          ),
        ],
      ),
    );
  }

  Widget buildSliverListItem(BuildContext context, int index) {
    return Center(
      child: ListTile(
        title: Text(exercises[index].name),
      ),
    );
  }
}

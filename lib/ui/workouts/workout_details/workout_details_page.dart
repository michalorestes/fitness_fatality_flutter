import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/logging_parameters/reps_logging.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout_exercise.dart';
import 'package:fitness_fatality_flutter/routing/routing.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/logging_page.dart';
import 'package:flutter/material.dart';

class WorkoutDetailsPage extends StatelessWidget {
  final Workout _workout;

  final List<WorkoutExercise> workoutExercises = [
    WorkoutExercise(
        exercise: Exercise(name: "Push Ups"),
        workoutId: 1,
        loggingParameters: RepsLogging({"sets": 1, "reps": 12})),
    WorkoutExercise(
        exercise: Exercise(name: "Crunches"),
        workoutId: 1,
        loggingParameters: RepsLogging({"sets": 1, "reps": 12})),
    WorkoutExercise(
        exercise: Exercise(name: "Press ups"),
        workoutId: 1,
        loggingParameters: RepsLogging({"sets": 2, "reps": 12})),
    WorkoutExercise(
        exercise: Exercise(name: "Biceps curl"),
        workoutId: 1,
        loggingParameters: RepsLogging({"sets": 3, "reps": 12})),
    WorkoutExercise(
        exercise: Exercise(name: "Pull ups"),
        workoutId: 1,
        loggingParameters: RepsLogging({"sets": 3, "reps": 12})),
  ];

  WorkoutDetailsPage(this._workout);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Start!"),
        icon: Icon(Icons.play_arrow),
        backgroundColor: Colors.orange,
        elevation: 12,
        onPressed: () {
          Routing.navigate(
            context,
            LoggingPage(
              workout: _workout,
              exercises: workoutExercises,
            ),
          );
        },
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            floating: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(_workout.name),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(buildSliverListItem,
                childCount: workoutExercises.length),
          ),
        ],
      ),
    );
  }

  Widget buildSliverListItem(BuildContext context, int index) {
    Exercise exercise = workoutExercises[index].exercise;

    return Center(
      child: ListTile(
        title: Text(exercise.name),
        subtitle: Text(workoutExercises[index].loggingParameters.toString()),
        leading: Image.asset(
          exercise.getIconAsset(),
          height: 32,
          width: 32,
        ),
        onTap: () {},
      ),
    );
  }
}

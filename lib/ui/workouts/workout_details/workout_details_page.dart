import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout_exercise.dart';
import 'package:flutter/material.dart';

class WorkoutDetailsPage extends StatelessWidget {
  final Workout _workout;


  final List<WorkoutExercise> workoutExercises = [
    WorkoutExercise(exercise: Exercise(name: "Push Ups"), workoutId: 1, loggingParameters: {"sets": 3, "reps": 12}),
    WorkoutExercise(exercise: Exercise(name: "Crunches"), workoutId: 1, loggingParameters: {"sets": 5, "reps": 6}),
    WorkoutExercise(exercise: Exercise(name: "Press ups"), workoutId: 1, loggingParameters: {"sets": 2, "reps": 1}),
    WorkoutExercise(exercise: Exercise(name: "Biceps curl"), workoutId: 1, loggingParameters: {"sets": 6, "reps": 20}),
    WorkoutExercise(exercise: Exercise(name: "Pull ups"), workoutId: 1, loggingParameters: {"sets": 3, "reps": 12}),
    WorkoutExercise(exercise: Exercise(name: "Rows"), workoutId: 1, loggingParameters: {"sets": 3, "reps": 12}),
    WorkoutExercise(exercise: Exercise(name: "Push Ups"), workoutId: 1, loggingParameters: {"sets": 3, "reps": 12}),
    WorkoutExercise(exercise: Exercise(name: "Crunches"), workoutId: 1, loggingParameters: {"sets": 5, "reps": 6}),
    WorkoutExercise(exercise: Exercise(name: "Press ups"), workoutId: 1, loggingParameters: {"sets": 2, "reps": 1}),
    WorkoutExercise(exercise: Exercise(name: "Biceps curl"), workoutId: 1, loggingParameters: {"sets": 6, "reps": 20}),
    WorkoutExercise(exercise: Exercise(name: "Pull ups"), workoutId: 1, loggingParameters: {"sets": 3, "reps": 12}),
    WorkoutExercise(exercise: Exercise(name: "Rows"), workoutId: 1, loggingParameters: {"sets": 3, "reps": 12}),
    WorkoutExercise(exercise: Exercise(name: "Push Ups"), workoutId: 1, loggingParameters: {"sets": 3, "reps": 12}),
    WorkoutExercise(exercise: Exercise(name: "Crunches"), workoutId: 1, loggingParameters: {"sets": 5, "reps": 6}),
    WorkoutExercise(exercise: Exercise(name: "Press ups"), workoutId: 1, loggingParameters: {"sets": 2, "reps": 1}),
    WorkoutExercise(exercise: Exercise(name: "Biceps curl"), workoutId: 1, loggingParameters: {"sets": 6, "reps": 20}),
    WorkoutExercise(exercise: Exercise(name: "Pull ups"), workoutId: 1, loggingParameters: {"sets": 3, "reps": 12}),
    WorkoutExercise(exercise: Exercise(name: "Rows"), workoutId: 1, loggingParameters: {"sets": 3, "reps": 12}),
    WorkoutExercise(exercise: Exercise(name: "Push Ups"), workoutId: 1, loggingParameters: {"sets": 3, "reps": 12}),
    WorkoutExercise(exercise: Exercise(name: "Crunches"), workoutId: 1, loggingParameters: {"sets": 5, "reps": 6}),
    WorkoutExercise(exercise: Exercise(name: "Press ups"), workoutId: 1, loggingParameters: {"sets": 2, "reps": 1}),
    WorkoutExercise(exercise: Exercise(name: "Biceps curl"), workoutId: 1, loggingParameters: {"sets": 6, "reps": 20}),
    WorkoutExercise(exercise: Exercise(name: "Pull ups"), workoutId: 1, loggingParameters: {"sets": 3, "reps": 12}),
    WorkoutExercise(exercise: Exercise(name: "Rows"), workoutId: 1, loggingParameters: {"sets": 3, "reps": 12}),
  ];

  WorkoutDetailsPage(this._workout);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.blue,
        elevation: 12,
        onPressed: () {},
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
              background: Container(),
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
    return Center(
      child: ListTile(
        title: Text(workoutExercises[index].exercise.name),
      ),
    );
  }
}

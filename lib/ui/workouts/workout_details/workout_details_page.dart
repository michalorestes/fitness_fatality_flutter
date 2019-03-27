import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';
import 'package:fitness_fatality_flutter/data/entities/logs/logging_parameters/reps_logging.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout_exercise.dart';
import 'package:fitness_fatality_flutter/routing/routing.dart';
import 'package:fitness_fatality_flutter/ui/exercises/exerciseDatabase/add_exercise_page.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/logging_page.dart';
import 'package:flutter/material.dart';

class WorkoutDetailsPage extends StatelessWidget {
  final Workout _workout;

  final List<WorkoutExercise> workoutExercises = [
    WorkoutExercise(
        exercise: Exercise(name: "Push Ups"),
        workoutId: 1,
        loggingParameters: RepsLogging({"sets": 3, "reps": 12})),
    WorkoutExercise(
        exercise: Exercise(name: "Crunches"),
        workoutId: 1,
        loggingParameters: RepsLogging({"sets": 2, "reps": 12})),
    WorkoutExercise(
        exercise: Exercise(name: "Press ups"),
        workoutId: 1,
        loggingParameters: RepsLogging({"sets": 1, "reps": 12})),
    WorkoutExercise(
        exercise: Exercise(name: "Biceps curl"),
        workoutId: 1,
        loggingParameters: RepsLogging({"sets": 1, "reps": 12})),
    WorkoutExercise(
        exercise: Exercise(name: "Pull ups"),
        workoutId: 1,
        loggingParameters: RepsLogging({"sets": 1, "reps": 12})),
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
        loggingParameters: RepsLogging({"sets": 1, "reps": 12})),
    WorkoutExercise(
        exercise: Exercise(name: "Biceps curl"),
        workoutId: 1,
        loggingParameters: RepsLogging({"sets": 1, "reps": 12})),
    WorkoutExercise(
        exercise: Exercise(name: "Pull ups"),
        workoutId: 1,
        loggingParameters: RepsLogging({"sets": 1, "reps": 12})),
  ];

  WorkoutDetailsPage(this._workout);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(_workout.name, style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: () => Navigator.pop(context),),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: EdgeInsets.only(left: 8),
          child: Container(
            height: 56,
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Routing.navigate(context, AddExercisePage());
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(context: context, builder: (context) {
                      return Container(height: 400,child: Center(child: Text("COMMING SOON!")));
                    });
                  },
                  icon: Icon(
                    Icons.edit_attributes,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
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
      body: ListView.builder(
        itemBuilder: buildSliverListItem,
        itemCount: workoutExercises.length,
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
        onTap: () {
          showDialog(context: context, builder: (BuildContext context) => AlertDialog(title: Text("ssdsd"), content: Text("Comming Soon!"),));
        },
      ),
    );
  }
}

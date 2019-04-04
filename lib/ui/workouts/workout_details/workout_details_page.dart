import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout_exercise.dart';
import 'package:fitness_fatality_flutter/routing/routing.dart';
import 'package:fitness_fatality_flutter/ui/exercises/exerciseDatabase/add_exercise_page.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/logging_page.dart';
import 'package:fitness_fatality_flutter/ui/workouts/workout_details/bloc/workout_details_bloc.dart';
import 'package:fitness_fatality_flutter/ui/workouts/workout_details/bloc/workout_details_events.dart';
import 'package:fitness_fatality_flutter/ui/workouts/workout_details/bloc/workout_details_state.dart';
import 'package:fitness_fatality_flutter/ui/workouts/workout_details/widgets/modals/workout_exercise_modal/workout_exercise_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutDetailsPage extends StatelessWidget {
  final WorkoutDetailsBloc bloc = WorkoutDetailsBloc();

  WorkoutDetailsPage(Workout workout) {
    bloc.dispatch(OnInitialiseWorkoutDetails(workout));
    bloc.dispatch(OnLoadWorkoutExercises());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          bloc.currentState.workoutDetails.name,
        ),
      ),
      bottomNavigationBar: buildBottomAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.orange,
        elevation: 12,
        onPressed: () {
          Routing.navigate(
            context,
            LoggingPage(
              workout: bloc.currentState.workoutDetails,
              exercises: bloc.currentState.exercises,
            ),
          );
        },
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, WorkoutDetailsState state) {
          return _MyWorkoutExercisesList(
            workoutExercises: state.exercises,
          );
        },
      ),
    );
  }

  Widget buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
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
                  Routing.navigate(
                    context,
                    AddExercisePage(bloc.currentState.workoutDetails.id),
                  ).then((var val) {
                    bloc.dispatch(OnLoadWorkoutExercises());
                  });
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_attributes,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyWorkoutExercisesList extends StatelessWidget {

  final List<WorkoutExercise> workoutExercises;

  _MyWorkoutExercisesList({this.workoutExercises});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: buildListItem,
      itemCount: workoutExercises.length,
    );
  }

  Widget buildListItem(BuildContext context, int index) {
    Exercise exercise = workoutExercises[index].exercise;
    return Center(
      child: ListTile(
        title: Text(exercise.name),
        subtitle: Text(workoutExercises[index].loggingTarget.toString()),
        leading: Image.asset(
          exercise.getIconAsset(),
          height: 32,
          width: 32,
        ),
        onTap: () => showModal(context, index),
      ),
    );
  }

  Future showModal(BuildContext context, int index) => showModalBottomSheet(
    context: context,
    builder: (context) {
      return ExerciseInfoModal(
        workoutExercises[index],
      );
    },
  );
}

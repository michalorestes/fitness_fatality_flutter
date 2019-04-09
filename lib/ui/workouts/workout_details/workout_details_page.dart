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

class WorkoutDetailsPage extends StatefulWidget {
  final WorkoutDetailsBloc bloc = WorkoutDetailsBloc();
  WorkoutDetailsPage(Workout workout) {
    bloc.dispatch(OnInitialiseWorkoutDetails(workout));
    bloc.dispatch(OnLoadWorkoutExercises());
  }

  @override
  _WorkoutDetailsPageState createState() => _WorkoutDetailsPageState();
}

class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          widget.bloc.currentState.workoutDetails.name,
        ),
      ),
      bottomNavigationBar: buildBottomAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.orange,
        elevation: 12,
        onPressed: () => navigateToLoggingPage(context),
      ),
      body: BlocBuilder(
        bloc: widget.bloc,
        builder: (BuildContext context, WorkoutDetailsState state) {
          return BlocProvider(
            bloc: widget.bloc,
            child: ListView.builder(
              itemBuilder: buildListItem,
              itemCount: widget.bloc.currentState.exercises.length,
            ),
          );
        },
      ),
    );
  }

  void navigateToLoggingPage(BuildContext context) {
    Routing.navigate(
      context,
      LoggingPage(
        workout: widget.bloc.currentState.workoutDetails,
        exercises: widget.bloc.currentState.exercises,
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
                    AddExercisePage(widget.bloc.currentState.workoutDetails.id),
                  ).then((var val) {
                    widget.bloc.dispatch(OnLoadWorkoutExercises());
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

  Widget buildListItem(BuildContext context, int index) {
    Exercise exercise = widget.bloc.currentState.exercises[index].exercise;
    return Center(
      child: ListTile(
        title: Text(exercise.name),
        subtitle: Text(
            widget.bloc.currentState.exercises[index].loggingTarget.toString()),
        leading: Image.asset(
          exercise.getIconAsset(),
          height: 32,
          width: 32,
        ),
        onTap: () => _editWorkoutExercise(context, index),
      ),
    );
  }

  void _editWorkoutExercise(BuildContext context, int index) {
    widget.bloc.dispatch(OnSelectWorkoutExercise(
        workoutExercise: widget.bloc.currentState.exercises[index]));
    showModal(context).then((var val) {
      scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Logging target has been updated"),));
    });
  }

  Future showModal(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) {
          return BlocProvider(
            bloc: widget.bloc,
            child: ExerciseInfoModal(),
          );
        },
      );
}

import 'package:fitness_fatality_flutter/routing/routing.dart';
import 'package:fitness_fatality_flutter/ui/exercises/exerciseDatabase/bloc/bloc_events.dart';
import 'package:fitness_fatality_flutter/ui/exercises/exerciseDatabase/bloc/exercise_bloc.dart';
import 'package:fitness_fatality_flutter/ui/exercises/exerciseDatabase/bloc/exercise_state.dart';
import 'package:fitness_fatality_flutter/ui/exercises/exerciseDatabase/create_custom_exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExercisePage extends StatelessWidget {
  final ExerciseBloc bloc = ExerciseBloc();

  AddExercisePage(int workoutId) {
    bloc.dispatch(OnInitialiseExerciseData(workoutId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Exercises to workout"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Routing.navigate(context, CreateCustomExercise()),
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, ExerciseState state) {
          return Container(
            child: ListView.builder(
              itemBuilder: _buildListItems,
              itemCount: state.exercises.length,
            ),
          );
        },
      ),
    );
  }

  Widget _buildListItems(BuildContext context, int index) {
    return ListTile(
      title: Text(bloc.currentState.exercises[index].name),
      subtitle: Text(bloc.currentState.exercises[index].primaryMuscle),
      trailing: IconButton(
        icon: Icon(Icons.add),
        onPressed: () => bloc.dispatch(
              OnExerciseAddedToWorkout(
                exerciseId: bloc.currentState.exercises[index].id,
              ),
            ),
      ),
    );
  }
}

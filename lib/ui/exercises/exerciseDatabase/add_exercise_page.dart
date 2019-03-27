import 'package:fitness_fatality_flutter/ui/exercises/exerciseDatabase/bloc/exercise_bloc.dart';
import 'package:fitness_fatality_flutter/ui/exercises/exerciseDatabase/bloc/exercise_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExercisePage extends StatelessWidget {
  final ExerciseBloc bloc = ExerciseBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Exercises to workout"),
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, ExerciseState state) {
          return Container(
            child: ListView.builder(itemBuilder: _buildListItems, itemCount: state.exercises.length,),
          );
        },
      ),
    );
  }

  Widget _buildListItems(BuildContext context, int index) {
    print(index);
    return ListTile(
      title: Text(bloc.currentState.exercises[index].name),
      subtitle: Text(bloc.currentState.exercises[index].muscleGroups.primaryGroup.toString()),
      trailing: Icon(Icons.add),
    );
  }
}

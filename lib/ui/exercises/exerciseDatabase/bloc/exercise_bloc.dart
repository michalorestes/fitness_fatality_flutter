
import 'package:bloc/bloc.dart';
import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';
import 'package:fitness_fatality_flutter/ui/exercises/exerciseDatabase/bloc/exercise_state.dart';

enum Events {
  INITIALISE_EXERCISES_DATA,
}

class ExerciseBloc extends Bloc<Events, ExerciseState> {
  @override
  ExerciseState get initialState => ExerciseState.initial();

  @override
  Stream<ExerciseState> mapEventToState(ExerciseState currentState, Events event) async* {
    switch (event) {
      case Events.INITIALISE_EXERCISES_DATA:
        List<Exercise> data = await Exercise.fetchAllExercises();
        
        yield ExerciseState(
          exercises: data
        );
        break;
      default:
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:fitness_fatality_flutter/ui/exercises/exerciseDatabase/bloc/exercise_state.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/bloc/bloc_component.dart';

class ExerciseBloc extends Bloc<BlocEvents, ExerciseState> {
  @override
  ExerciseState get initialState => ExerciseState.initial();

  @override
  Stream<ExerciseState> mapEventToState(ExerciseState currentState, BlocEvents event) {
    // TODO: implement mapEventToState
    return null;
  }
}
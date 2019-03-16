import 'package:bloc/bloc.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout_exercise.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/bloc/bloc_state.dart';

enum BlocEvents { NextEvent }

class ExerciseIndexes {
  int currentExerciseIndex;
  int currentSet;

  ExerciseIndexes(this.currentExerciseIndex, this.currentSet);
}

class BlocComponent extends Bloc<BlocEvents, BlocState> {
  Workout workout;
  List<WorkoutExercise> exercises;

  BlocState get initialState => BlocState.initial(workout, exercises);

  BlocComponent(this.workout, this.exercises);

  @override
  Stream<BlocState> mapEventToState(
    BlocState currentState,
    BlocEvents event,
  ) async* {
    switch (event) {
      case BlocEvents.NextEvent:
        yield _nextEvent();
        break;
    }
  }

  BlocState _nextEvent() {
    Containers nextContainer = _getNextContainer();

    ExerciseIndexes exerciseIndexes = ExerciseIndexes(
      currentState.currentExerciseIndex,
      currentState.currentSetIndex,
    );

    if (nextContainer == Containers.CONTROLS) {
      exerciseIndexes = _updateExerciseIndexes();
    }

    return BlocState(
      workout: currentState.workout,
      exercises: currentState.exercises,
      currentContainer: nextContainer,
      currentExerciseIndex: exerciseIndexes.currentExerciseIndex,
      currentSetIndex: exerciseIndexes.currentSet,
    );
  }

  Containers _getNextContainer() {
    if (!_isNextExerciseAvailable() && !_isNextSetAvailable()) {
      return Containers.END;
    } else if (currentState.currentContainer == Containers.CONTROLS) {
      return Containers.TIMER;
    } else {
      return Containers.CONTROLS;
    }
  }

  ExerciseIndexes _updateExerciseIndexes() {
    int currentExerciseIndex = currentState.currentExerciseIndex;
    int currentSet = currentState.currentSetIndex;

    if (_isNextSetAvailable()) {
      currentSet++;
    } else if (_isNextExerciseAvailable()) {
      currentSet = 1;
      currentExerciseIndex++;
    }

    return ExerciseIndexes(
      currentExerciseIndex,
      currentSet,
    );
  }

  bool _isNextSetAvailable() {
    return (currentState.currentSetIndex <
        currentState.currentLogging.getParameters()['sets']);
  }

  bool _isNextExerciseAvailable() {
    return (currentState.currentExerciseIndex <
        currentState.exercises.length - 1);
  }
}

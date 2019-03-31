import 'package:bloc/bloc.dart';
import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';
import 'package:fitness_fatality_flutter/data/repository/exercise_repository.dart';
import 'package:fitness_fatality_flutter/data/repository/workout_exercise_repository.dart';
import 'package:fitness_fatality_flutter/ui/exercises/exerciseDatabase/bloc/bloc_events.dart';
import 'package:fitness_fatality_flutter/ui/exercises/exerciseDatabase/bloc/exercise_state.dart';

enum Events {
  INITIALISE_EXERCISES_DATA,
  ADD_EXERCISE_TO_WORKOUT,
}

class ExerciseBloc extends Bloc<BlocEvents, ExerciseState> {
  final ExerciseRepository repository = ExerciseRepository();
  final WorkoutExerciseRepository workoutExerciseRepository = WorkoutExerciseRepository();

  @override
  ExerciseState get initialState => ExerciseState.initial();

  @override
  Stream<ExerciseState> mapEventToState(
      ExerciseState currentState, BlocEvents event) async* {
    if (event is OnInitialiseExerciseData) {
      List<Exercise> data = await repository.fetchAllExercises();
      yield ExerciseState(exercises: data, workoutId: event.workoutId);
    } else if(event is OnExerciseAddedToWorkout) {
      int exerciseId = event.exerciseId;
      workoutExerciseRepository.assignExerciseWithDefaultValues(exerciseId, currentState.workoutId);
      workoutExerciseRepository.fetchAllWorkoutExercises();

      Workout.getAllWorkouts().then((List<Workout> d) => d.forEach((Workout a) => print(a.toJson())));

    }
  }
}

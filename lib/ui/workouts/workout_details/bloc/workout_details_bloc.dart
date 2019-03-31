import 'package:bloc/bloc.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout_exercise.dart';
import 'package:fitness_fatality_flutter/data/repository/workout_exercise_repository.dart';
import 'package:fitness_fatality_flutter/ui/workouts/workout_details/bloc/workout_details_events.dart';
import 'package:fitness_fatality_flutter/ui/workouts/workout_details/bloc/workout_details_state.dart';

class WorkoutDetailsBloc
    extends Bloc<WorkoutDetailsEvents, WorkoutDetailsState> {
  final WorkoutExerciseRepository workoutExerciseRepository =
      WorkoutExerciseRepository();

  @override
  WorkoutDetailsState get initialState => WorkoutDetailsState.initial();
  
  @override
  Stream<WorkoutDetailsState> mapEventToState(
      WorkoutDetailsState currentState, WorkoutDetailsEvents event) async* {
    if (event is OnInitialiseWorkoutDetails) {
      yield WorkoutDetailsState(
        workoutDetails: event.workout,
        exercises: List(),
      );
    }

    if(event is OnLoadWorkoutExercises) {
      List<WorkoutExercise> data = await workoutExerciseRepository.fetchByWorkoutId(currentState.workoutDetails.id) ?? List<WorkoutExercise>();
      yield WorkoutDetailsState(
        workoutDetails: currentState.workoutDetails,
        exercises: data,
      );
    }
  }
}

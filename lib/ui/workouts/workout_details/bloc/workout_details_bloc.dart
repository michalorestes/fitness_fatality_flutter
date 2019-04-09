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
    WorkoutDetailsState currentState,
    WorkoutDetailsEvents event,
  ) async* {
    if (event is OnInitialiseWorkoutDetails) {
      yield currentState.updateState(
        WorkoutDetailsState(
          workoutDetails: event.workout,
          exercises: List(),
          selectedWorkoutExercise: currentState.selectedWorkoutExercise,
          isSnackBarDisplayed: false,
        ),
      );
    }

    if (event is OnLoadWorkoutExercises) {
      List<WorkoutExercise> data = await workoutExerciseRepository
              .fetchByWorkoutId(currentState.workoutDetails.id) ??
          List<WorkoutExercise>();

      yield WorkoutDetailsState(
          workoutDetails: currentState.workoutDetails,
          exercises: data,
          selectedWorkoutExercise: currentState.selectedWorkoutExercise,
          isSnackBarDisplayed: false,
          );
    }
  
    if (event is OnSelectWorkoutExercise) {
      yield currentState.updateState(
        WorkoutDetailsState(
          workoutDetails: currentState.workoutDetails,
          exercises: currentState.exercises,
          selectedWorkoutExercise: event.workoutExercise,
        ),
      );
    }

    if (event is OnUpdateWorkoutExercise) {
      WorkoutExercise exercise = event.workoutExercise;

      int numberOfChanges = await exercise.update();
      
      List<WorkoutExercise> data = await workoutExerciseRepository
              .fetchByWorkoutId(currentState.workoutDetails.id) ??
          List<WorkoutExercise>();

      yield currentState.updateState(
        WorkoutDetailsState(
          workoutDetails: currentState.workoutDetails,
          selectedWorkoutExercise: exercise,
          exercises: data,
          isSnackBarDisplayed: (numberOfChanges > 0),
        ),
      );
    }

    if (event is OnRepsChange) {
      WorkoutExercise workoutExercise =
          currentState.selectedWorkoutExercise.clone();
      workoutExercise.loggingTarget.parametersMap['reps'] = event.newRepsNumber;

      yield currentState.updateState(WorkoutDetailsState(
        workoutDetails: currentState.workoutDetails,
        selectedWorkoutExercise: workoutExercise,
        exercises: currentState.exercises,
      ));
    }

    if (event is OnSetsChange) {
      WorkoutExercise workoutExercise =
          currentState.selectedWorkoutExercise.clone();
      workoutExercise.loggingTarget.parametersMap['sets'] = event.newSetsNumber;

      yield currentState.updateState(WorkoutDetailsState(
        workoutDetails: currentState.workoutDetails,
        selectedWorkoutExercise: workoutExercise,
        exercises: currentState.exercises,
      ));
    }

    if (event is OnRestChange) {
      WorkoutExercise workoutExercise =
          currentState.selectedWorkoutExercise.clone();
      workoutExercise.loggingTarget.parametersMap['rest'] = event.newRestTime;

      yield currentState.updateState(WorkoutDetailsState(
        workoutDetails: currentState.workoutDetails,
        selectedWorkoutExercise: workoutExercise,
        exercises: currentState.exercises,
      ));
    }
  }
}

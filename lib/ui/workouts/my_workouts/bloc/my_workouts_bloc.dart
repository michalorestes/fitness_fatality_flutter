import 'package:bloc/bloc.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';
import 'package:fitness_fatality_flutter/ui/workouts/my_workouts/bloc/my_workouts_state.dart';

enum Events { LOAD_WORKOUTS, RELOAD_WORKOUTS }

class MyWorkoutsBloc extends Bloc<Events, MyWorkoutsState> {
  @override
  MyWorkoutsState get initialState => MyWorkoutsState.initial();

  @override
  Stream<MyWorkoutsState> mapEventToState(
      MyWorkoutsState currentState, Events event) async* {
    switch (event) {
      case Events.LOAD_WORKOUTS:
      case Events.RELOAD_WORKOUTS:
       List<Workout> s = await Workout.getAllWorkouts();
        yield MyWorkoutsState(
          workouts: s ?? List()
        );
        break;
      default:
    }
  }
}

import 'package:fitness_fatality_flutter/data/entities/workout/workout.dart';
import 'package:fitness_fatality_flutter/routing/routing.dart';
import 'package:fitness_fatality_flutter/ui/workouts/create_new_workout/create_new_workout_page.dart';
import 'package:fitness_fatality_flutter/ui/workouts/my_workouts/bloc/my_workouts_bloc.dart';
import 'package:fitness_fatality_flutter/ui/workouts/my_workouts/bloc/my_workouts_state.dart';
import 'package:fitness_fatality_flutter/ui/workouts/workout_details/workout_details_page.dart';
import 'package:fitness_fatality_flutter/widgets/workout_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyWorkoutsPage extends StatefulWidget {
  @override
  State<MyWorkoutsPage> createState() {
    return MyWorkoutsPageState();
  }
}

class MyWorkoutsPageState extends State<MyWorkoutsPage> {
  MyWorkoutsBloc bloc = MyWorkoutsBloc();

  MyWorkoutsPageState() {
    bloc.dispatch(Events.LOAD_WORKOUTS);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Fitness Fatality")),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPress,
        child: Icon(Icons.add),
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, MyWorkoutsState state) =>
            _WorkoutsList(workouts: state.workouts),
      ),
    );
  }

  void _onFabPress() {
    Routing.navigate<Workout>(context, CreateNewWorkoutPage())
        .then((var t) => bloc.dispatch(Events.RELOAD_WORKOUTS));
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}

class _WorkoutsList extends StatelessWidget {
  final List<Workout> workouts;

  _WorkoutsList({this.workouts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildListItem(context, index));
  }

  Widget _buildListItem(BuildContext context, int index) {
    Workout workout = workouts[index];

    String imageAsset = "assets/weights_workout_icon.png";
    if (workout.type == WorkoutTypes.CARDIO) {
      imageAsset = "assets/cardio_workout_icon.png";
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 32 == index ? 72 : 0),
      child: WorkoutListTile(
        name: workout.name,
        type: workout.workoutType,
        icon: imageAsset,
        onTap: () {
          Routing.navigate(context, WorkoutDetailsPage(workout));
        },
        onChipTap: () {},
      ),
    );
  }
}

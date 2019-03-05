import 'package:fitness_fatality_flutter/ui/workouts/create_new_workout/create_new_workout_page.dart';
import 'package:flutter/material.dart';

enum Routes { WORKOUTS_PAGE, ADD_NEW_WORKOUT }

class Routing {
  static Future<T> navigate<T extends Object>(BuildContext context, Routes route) {
    MaterialPageRoute<T> materialPageRoute = _buildRoute<T>(route);

    return Navigator.push(context, materialPageRoute);
  }

  static MaterialPageRoute _buildRoute<T extends Object>(Routes route) {
    MaterialPageRoute<T> materialPageRoute;
    switch (route) {
      case Routes.ADD_NEW_WORKOUT:
        materialPageRoute = MaterialPageRoute<T>(
          builder: (BuildContext context) => CreateNewWorkoutPage(),
        );
        break;
      default:
        materialPageRoute = null;
    }

    return materialPageRoute;
  }
}

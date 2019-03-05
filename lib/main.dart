import 'package:fitness_fatality_flutter/ui/workouts/my_workouts/my_workouts_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Fitness Fatality',
      theme: ThemeData(
          fontFamily: "Roboto",
          primaryColor: Color(0xFF2F6FCF),
          accentColor: Colors.green,
          buttonColor: Colors.blueAccent,
          pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
              })),
      initialRoute: '/',
      routes: {
        '/': (context) => MyWorkoutsPage(),
      },
    );
  }
}

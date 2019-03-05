import 'package:fitness_fatality_flutter/pages/workout_page.dart';
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
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WorkoutsPage(),
      },
    );
  }
}

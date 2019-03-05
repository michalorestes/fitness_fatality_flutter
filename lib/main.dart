import 'package:fitness_fatality_flutter/pages/workout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //TODO: Below snippet can be used for changing status bar color 
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    //   statusBarColor: Color(0xFF2F6FCF), //or set color with: Color(0xFF0000FF)
    // ));

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
        '/': (context) => WorkoutsPage(),
      },
    );
  }
}

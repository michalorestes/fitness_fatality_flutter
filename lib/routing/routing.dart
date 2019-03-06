import 'package:flutter/material.dart';

class Routing {
  static Future<T> navigate<T extends Object>(
      BuildContext context, Widget page) {
    MaterialPageRoute<T> materialPageRoute = MaterialPageRoute<T>(
      builder: (BuildContext context) => page,
    );

    return Navigator.push(context, materialPageRoute);
  }
}

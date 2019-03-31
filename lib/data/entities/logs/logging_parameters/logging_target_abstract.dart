import 'dart:convert';

import 'package:fitness_fatality_flutter/data/entities/logs/logging_parameters/reps_logging.dart';

abstract class LoggingTargetAbstract {

  LoggingTargetAbstract();
  
  void setParameters(Map<String, dynamic> parameters);
  Map<String, dynamic> getParameters();

  String toString() {
    String string = "";
    getParameters().forEach((k, v) {
      string += "$k: $v, ";
    });

    if (string.length != 0) {
      string =string.substring(0, string.length - 2);
    }

    return string;
  }

  String toJson() {
    return jsonEncode(getParameters());
  }

  factory LoggingTargetAbstract.fromJson(String json) {
    print(json); 
    print(jsonDecode(json)); 
    //TODO: Decode JSON correctly 
    return RepsLogging();
  }
}

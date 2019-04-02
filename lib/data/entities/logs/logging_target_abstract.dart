import 'dart:convert';

class LoggingTarget {

  Map<String, dynamic> _parameters = Map<String, dynamic>(); 

  Map<String, dynamic> get parametersMap => _parameters;
  String get parametersAsJsonString => jsonEncode(_parameters);
  set parametersFromJsonString(String json) => _parameters = jsonDecode(json);
  
  LoggingTarget(dynamic parametersData) {
    if(parametersData != null && parametersData is String) {
      _parameters = jsonDecode(parametersData);
    } else if (parametersData != null && parametersData is Map) {
      _parameters = parametersData;
    }
  }

  String toString() {
    String string = "";
    _parameters.forEach((k, v) {
      string += "$k: $v, ";
    });

    if (string.length != 0) {
      string = string.substring(0, string.length - 2);
    }

    return string;
  }

  factory LoggingTarget.fromJson(String json) {
    return LoggingTarget(json);
  }
}

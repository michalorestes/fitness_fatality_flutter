
import 'package:fitness_fatality_flutter/data/entities/logs/logging_parameters/logging_parameters_abstract.dart';

class RepsLogging extends LoggingParametersAbstract {
  Map<String, dynamic> parameters = Map<String, dynamic>();

  RepsLogging([Map<String, dynamic> parameters]) {
    if (parameters != null) {
      this.parameters = parameters;
    }
  }

  @override
  Map<String, dynamic> getParameters() {
    return parameters;
  }

  @override
  void setParameters(Map<String, dynamic> parameters) {
    this.parameters.clear();
    this.parameters.addAll(parameters);
  }
}

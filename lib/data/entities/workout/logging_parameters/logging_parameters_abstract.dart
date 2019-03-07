abstract class LoggingParametersAbstract {
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

}
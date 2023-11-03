import 'package:intl/intl.dart';

String convertTempCToString(String temp) {
  var tempDouble = double.parse(temp);
  if (tempDouble.isNegative) {
    return "nan";
  }
  var newString = "${double.parse(temp).toStringAsFixed(1)}°C";
  return newString;
}

String convertHumidityToString(String humidity) {
  var tempDouble = double.parse(humidity);
  if (tempDouble.isNegative) {
    return "nan";
  }
  var newString = "${double.parse(humidity).toStringAsFixed(0)}%";
  return newString;
}

String convertPressureToString(String pressure) {
  var tempDouble = double.parse(pressure);
  if (tempDouble.isNegative) {
    return "nan";
  }
  var newString = "${double.parse(pressure).toStringAsFixed(0)}hPa";
  return newString;
}

String utcToLocal(String createdAt) {
  //"yyyy-MM-dd'T'HH:mm:ss'Z'"
  var newValue = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(createdAt);
  String result = DateFormat("yyyy-MM-dd HH:mm").format(newValue);
  return result;
}

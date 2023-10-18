
import 'forecastday_model.dart';

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday?.add(Forecastday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (forecastday != null) {
      data['forecastday'] = forecastday?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


import 'forecastday_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'forecast_model.g.dart';
@JsonSerializable()
class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});
factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
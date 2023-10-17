

import 'astro_model.dart';
import 'day_model.dart';
import 'hour_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'forecastday_model.g.dart';
@JsonSerializable()
class Forecastday {
  String? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday({this.date, this.dateEpoch, this.day, this.astro, this.hour});
factory Forecastday.fromJson(Map<String, dynamic> json) =>
      _$ForecastdayFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastdayToJson(this);
}
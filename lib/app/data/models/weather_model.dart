import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'current_model.dart';
import 'forecast_model.dart';
import 'location_model.dart';

part 'weather_model.g.dart';

@RestApi(baseUrl: 'http://api.weatherapi.com/v1')
abstract class WeatherObjectRestClient {
  factory WeatherObjectRestClient(Dio dio, {String baseUrl}) =
      _WeatherObjectRestClient;

  @GET("/forecast.json")
  Future<Weather> getWeather(
    @Query('key') String key,
    @Query('q') String query,
    @Query('days') int days,
  );
}

@JsonSerializable()
class Weather {
  Location? location;
  Current? current;
  Forecast? forecast;

  Weather({this.location, this.current, this.forecast});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

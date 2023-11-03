//https://api.thingspeak.com/channels/2279522/feeds.json?results=2

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'models.dart';

part 'weather_client.g.dart';

@RestApi()
abstract class WeatherObjectRestClient {
  factory WeatherObjectRestClient(Dio dio, {String baseUrl}) =
      _WeatherObjectRestClient;

  @GET('/feeds.json')
  Future<Weather> getWeathers(
    @Query('results') int results,
  );
}

@JsonSerializable()
class Weather {
  WeatherChannel? channel;
  List<WeatherFeed>? feeds;

  Weather({this.channel, this.feeds});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

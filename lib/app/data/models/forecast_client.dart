import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'models.dart';

part 'forecast_client.g.dart';

@RestApi()
abstract class ForecastObjectRestClient {
  factory ForecastObjectRestClient(Dio dio, {String baseUrl}) =
      _ForecastObjectRestClient;

  @GET('/feeds.json')
  Future<Forecast> getForecasts(
    @Query('api_key') String apiKey,
    @Query('results') int results,
  );
}

@JsonSerializable()
class Forecast {
  ForecastChannel? channel;
  List<ForecastFeed>? feeds;

  Forecast({this.channel, this.feeds});

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

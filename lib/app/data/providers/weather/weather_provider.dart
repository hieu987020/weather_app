import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/data/models/weather_model.dart';
import 'weather_provider_interface.dart';

class WeatherProvider extends GetxService implements IWeatherProvider {
  final dio = Dio();

  @override
  Future<Weather> getWeather(String query, int days) async {
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
    final client =
        WeatherObjectRestClient(dio, baseUrl: 'http://api.weatherapi.com/v1');

    var key = "300f60949b9941cf8be45422231610";
    var result = client
        .getWeather(key, query, days)
        .then((value) => value)
        .catchError((error) => error);
    return result;
  }
}

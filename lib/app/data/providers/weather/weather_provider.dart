import 'package:get/get.dart';
import 'package:weather_app/app/data/models/chien_model.dart';
import 'package:weather_app/app/data/models/weather_model.dart';
import '../base_provider.dart';
import 'weather_provider_interface.dart';

class WeatherProvider extends GetxService implements IWeatherProvider {
  final dio = BaseProvider.dio;
  String apiUrl = BaseProvider.apiUrl ?? "";
  String apiKey = BaseProvider.apiKey ?? "";

  @override
  Future<Weather> getWeather(String query, int days) async {
    final client = WeatherObjectRestClient(dio, baseUrl: apiUrl);
    var result = client
        .getWeather(apiKey, query, days)
        .then((value) => value)
        .catchError((error) => error);
    return result;
  }

  @override
  Future<ChienWeather> getChienWeather(int results) {
    final client = ChienWeatherObjectRestClient(dio, baseUrl: apiUrl);
    var result = client
        .getWeather(results)
        .then((value) => value)
        .catchError((error) => error);
    return result;
  }
}

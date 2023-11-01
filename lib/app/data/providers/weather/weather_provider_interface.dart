import 'package:weather_app/app/data/models/chien_model.dart';

import '../../models/weather_model.dart';

abstract class IWeatherProvider {
  Future<Weather> getWeather(String query, int days);
  Future<ChienWeather> getChienWeather(int results);
}

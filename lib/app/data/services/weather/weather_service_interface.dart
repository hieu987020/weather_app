
import '../../models/chien_model.dart';
import '../../models/weather_model.dart';

abstract class IWeatherService {
  Future<Weather> getWeather(String query, int days);
  Future<ChienWeather> getChienWeather(int results);
}

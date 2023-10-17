import '../../models/weather_model.dart';

abstract class IWeatherProvider {
  Future<Weather> getWeather(String query, int days);
}

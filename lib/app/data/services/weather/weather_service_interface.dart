
import '../../models/weather_model.dart';

abstract class IWeatherService {
  Future<Weather> getWeather(String query, int days);
}

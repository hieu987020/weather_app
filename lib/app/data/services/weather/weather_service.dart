import 'package:get/get.dart';
import 'package:weather_app/app/data/models/models.dart';
import '../../providers/api/weather_provider.dart';
import 'weather_service_interface.dart';

class WeatherService extends GetxService implements IWeatherService {
  var provider = WeatherProvider();
  @override
  Future<Weather> getWeathers(int results) {
    var result = provider.getWeather(results);
    return result;
  }

}

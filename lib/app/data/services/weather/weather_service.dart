import 'package:get/get.dart';
import 'package:weather_app/app/data/models/weather_model.dart';
import '../../enums/provider_enum.dart';
import '../../providers/weather/weather_provider_interface.dart';
import 'weather_service_interface.dart';

class WeatherService extends GetxService implements IWeatherService {
  @override
  Future<Weather> getWeather(String query, int days) {
    var provider = Get.find<IWeatherProvider>(tag: ProviderEnum.WEATHER);
    var result = provider.getWeather(query, days);
    return result;
  }
}

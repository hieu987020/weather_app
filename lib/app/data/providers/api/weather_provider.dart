import '../../models/models.dart';
import '../base_provider.dart';

class WeatherProvider {
  final dio = BaseProvider.dio;
  String weatherApiUrl = BaseProvider.weatherApiUrl ?? "";
  String apiKey = BaseProvider.apiKey ?? "";

  Future<Weather> getWeather(int results) {
    final client = WeatherObjectRestClient(dio, baseUrl: weatherApiUrl);
    var result = client
        .getWeathers(results)
        .then((value) => value)
        .catchError((error) => error);
    return result;
  }

}

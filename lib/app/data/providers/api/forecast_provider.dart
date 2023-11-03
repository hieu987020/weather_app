import '../../models/models.dart';
import '../base_provider.dart';

class ForecastProvider {
  final dio = BaseProvider.dio;
  String forecastApiUrl = BaseProvider.forecastApiUrl ?? "";
  String apiKey = BaseProvider.apiKey ?? "";

  Future<Forecast> getForecast(int results) {
    final client = ForecastObjectRestClient(dio, baseUrl: forecastApiUrl);
    var result = client
        .getForecasts(apiKey, results)
        .then((value) => value)
        .catchError((error) => error);
    return result;
  }
}

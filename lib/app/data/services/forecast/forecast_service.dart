import 'package:get/get.dart';
import 'package:weather_app/app/data/models/models.dart';
import '../../providers/api/forecast_provider.dart';
import 'forecast_service_interface.dart';

class ForecastService extends GetxService implements IForecastService {
  var provider = ForecastProvider();

  @override
  Future<Forecast> getForecasts(int results) {
    var result = provider.getForecast(results);
    return result;
  }
}

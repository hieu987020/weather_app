import 'package:weather_app/app/data/models/models.dart';


abstract class IWeatherService {
  Future<Weather> getWeathers(int results);
}

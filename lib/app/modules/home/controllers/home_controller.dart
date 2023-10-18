// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../data/enums/service_enum.dart';
import '../../../data/models/hour_model.dart';
import '../../../data/services/weather/weather_service_interface.dart';

class HomeController extends GetxController {
  late final IWeatherService service;
  var name = "default name".obs;
  var tempc = "10".obs;
  var condition = "default condition".obs;
  var isLoading = false.obs;
  var hour = <Hour>[].obs;

  @override
  void onInit() {
    service = Get.find<IWeatherService>(tag: ServiceEnum.WEATHER);
    getWeather("Ho Chi Minh");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getWeather(String city) {
    isLoading(true);
    service.getWeather(city, 1).then(
      (value) {
        if (value.location != null) {
          name(value.location!.name);
        }
        if (value.current != null) {
          if (value.current!.feelslikeC != null) {
            var tempC = value.current!.tempC!.toInt();
            var tempcString = "$tempC" "°";
            tempc(tempcString);
          }
          condition(value.current!.condition!.text);
        }

        if (value.forecast != null) {
          if (value.forecast!.forecastday != null) {
            hour(value.forecast!.forecastday!.first.hour);
          }
        }

        if (value.forecast == null) {
          print("nullllll");
        }
        hour(value.forecast!.forecastday!.first.hour);
        // print(value.forecast!.forecastday!.length.toString());
        // print(value.forecast!.forecastday!.first.date);

        // print(value.forecast!.forecastday!.first.hour!.first.time);
        // print(value.forecast!.forecastday!.first.hour!.first.condition!.text);
        // print(value.forecast!.forecastday!.first.hour!.first.condition!.icon);
      },
    );
    isLoading(false);
  }

  Future<void> searchWeather(String city) async {
    isLoading(true);
    getWeather(city);
    isLoading(false);
  }
}

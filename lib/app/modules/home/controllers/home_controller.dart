// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:weather_app/app/data/models/forecastday_model.dart';
import '../../../data/enums/service_enum.dart';
import '../../../data/models/current_model.dart';
import '../../../data/models/hour_model.dart';
import '../../../data/models/location_model.dart';
import '../../../data/services/weather/weather_service_interface.dart';

class HomeController extends GetxController {
  late final IWeatherService service;

  // status of homeview
  var isLoading = false.obs;

  // data of weather
  var current = Current().obs;
  var location = Location().obs;
  var hour = <Hour>[].obs;
  var forecastday = <Forecastday>[].obs;
  var tempCInt = 10.obs;
  // get service then fetch Weather of "Ho Chi Minh"
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

  // get weather
  Future<void> getWeather(String city) async {
    isLoading(true);
    service.getWeather(city, 7).then(
      (value) {
        if (value.location != null) {
          location(value.location);
        }
        if (value.current != null) {
          current(value.current);
          var tempC = value.current!.tempC!.toInt();
          tempCInt(tempC);
        }
        if (value.forecast != null) {
          forecastday(value.forecast!.forecastday!);
          hour(value.forecast!.forecastday!.first.hour!);
        }
        isLoading(false);
      },
    );
  }

  // search weather
  void searchWeather(String city) {
    getWeather(city);
  }

}

// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import '../../../data/enums/service_enum.dart';
import '../../../data/models/models.dart';
import '../../../data/services/weather/weather_service_interface.dart';
import '../views/home_view.dart';

class HomeController extends GetxController {
  // declare service
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
    // get weather for default city (Ho Chi Minh)
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
    // show loading progress indicator
    isLoading(true);
    service.getWeather(city, 7).then(
      (value) {
        // get weather data from service and update to obs variable
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
        // back to home
        Get.back();
        // hide loading progress indicator
        isLoading(false);
      },
    ).onError((error, stackTrace) {
      // back to home
      // hide loading progress indicator
      showToast();
      isLoading(false);
    });
  }

  // search weather
  void searchWeather(String city) {
    getWeather(city);
  }
}

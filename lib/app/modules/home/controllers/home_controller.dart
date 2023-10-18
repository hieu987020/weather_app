// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
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

  /// get service then fetch Weather of "Ho Chi Minh"
  ///
  ///
  ///
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
      },
    );
    isLoading(false);
  }

  // search weather
  void searchWeather(String city) {
    getWeather(city);
  }
}

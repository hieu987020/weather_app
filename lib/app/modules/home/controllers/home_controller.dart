// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import '../../../data/enums/service_enum.dart';
import '../../../data/services/weather/weather_service_interface.dart';

class HomeController extends GetxController {
  late final IWeatherService service;
  var name = "default name".obs;
  var tempc = "10\u00B0".obs;
  var condition = "default condition".obs;
  var isLoading = false.obs;

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
    service.getWeather(city, 1).then((value) {
      if (value.location != null) {
        name(value.location!.name);
        return;
      }

      if (value.current != null) {
        var tempcString = "${value.current!.feelslikeC}" "\u00B0";
        tempc(tempcString);
        condition(value.current!.condition!.text);
      }
    });
    isLoading(false);
  }

  Future<void> searchWeather(String city) async {
    isLoading(true);
    service.getWeather(city, 1).then((value) {
      if (value.location == null) {
        return;
      } else {
        name(value.location!.name);
        var tempcString = "${value.current!.feelslikeC}" "\u00B0";
        tempc(tempcString);
        condition(value.current!.condition!.text);
      }
    });
    await Future.delayed(const Duration(seconds: 3));
    isLoading(false);
  }
}

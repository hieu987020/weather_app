import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'app/data/enums/enums.dart';
import 'app/data/providers/base_provider.dart';
import 'app/data/providers/weather/weather_provider.dart';
import 'app/data/providers/weather/weather_provider_interface.dart';
import 'app/data/services/weather/weather_service.dart';
import 'app/data/services/weather/weather_service_interface.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  // load file env
  await dotenv.load(fileName: 'assets/envs/url.env');

  // init service then run app
  await initServices().then(
    (value) => runApp(
      GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

// initiate shared services
Future<void> initServices() async {
  // get api url and shared key from environment
  BaseProvider().init(
    url: dotenv.env["URL"],
    key: dotenv.env["API_KEY"],
  );
  // put provider
  await Get.putAsync<IWeatherProvider>(
    () => Future(() => WeatherProvider()),
    tag: ProviderEnum.WEATHER,
  );
  // put service
  await Get.putAsync<IWeatherService>(
    () => Future(() => WeatherService()),
    tag: ServiceEnum.WEATHER,
  );

}

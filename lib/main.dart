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
  await dotenv.load(fileName: 'assets/envs/url.env');
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

// Initiate shared services
Future<void> initServices() async {
  BaseProvider().init(
    url: dotenv.env["URL"],
    key: dotenv.env["API_KEY"],
  );
  await Get.putAsync<IWeatherProvider>(
    () => Future(() => WeatherProvider()),
    tag: ProviderEnum.WEATHER,
  );
  await Get.putAsync<IWeatherService>(
    () => Future(() => WeatherService()),
    tag: ServiceEnum.WEATHER,
  );
}

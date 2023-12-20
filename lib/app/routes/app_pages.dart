import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/account/bindings/account_binding.dart';
import '../modules/account/views/account_view.dart';
import '../modules/forecast/bindings/forecast_binding.dart';
import '../modules/forecast/views/forecast_view.dart';
import '../modules/weather/bindings/weather_binding.dart';
import '../modules/weather/views/weather_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';


// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGN_IN;

  static final page = <String, Widget>{
    _Paths.SIGN_IN: const SignInView(),
    _Paths.SIGN_UP: const SignUpView(),
    _Paths.HOME: const HomeView(),
    _Paths.WEATHER: const WeatherView(),
    _Paths.FORECAST: const ForecastView(),
    _Paths.ACCOUNT: const AccountView(),
  };

  static final routes = [
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      bindings: [
        SignInBinding(),
        SignUpBinding(),
        HomeBinding(),
        WeatherBinding(),
        ForecastBinding(),
        AccountBinding(),
      ],
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WEATHER,
      page: () => const WeatherView(),
      binding: WeatherBinding(),
    ),
    GetPage(
      name: _Paths.WEATHER,
      page: () => const WeatherView(),
      binding: WeatherBinding(),
    ),
    GetPage(
      name: _Paths.FORECAST,
      page: () => const ForecastView(),
      binding: ForecastBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
  ];
}

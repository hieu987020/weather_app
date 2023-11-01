// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'home_view.dart';

/// Home Weather View
class ForecastView extends GetView<HomeController> {
  const ForecastView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1000,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blueGrey,
              Colors.blueAccent,
            ],
          ),
        ),
        child: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MainWeatherSecond(),
              HourlyWeather(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex:
              controller.currentIndex.value, // Set the initial selected index
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Today',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Forecast',
            ),
          ],
          onTap: (index) => controller.onTapNavigator(index),
        ),
      ),
    );
  }
}

/// Main Weather Widget
class MainWeatherSecond extends GetView<HomeController> {
  const MainWeatherSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 340,
        child: (controller.isLoading.value)
            ? Center(
                child: const CircularProgressIndicator(),
              )
            : Column(
                children: [
                  const SizedBox(height: 20),
                  // menu
                  const SizedBox(height: 50),
                  // city name text
                  Text(
                    controller.name.value,
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // temperature in celsius text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          controller.tempC.value,
                          style: const TextStyle(
                            fontSize: 96,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // weather condition text
                  Text(
                    controller.createdAt.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

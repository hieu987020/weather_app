// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/models.dart';
import '../../shared/text.dart';
import '../../shared/weather_content.dart';
import '../controllers/weather_controller.dart';

class WeatherView extends GetView<WeatherController> {
  const WeatherView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.isLoading.value)
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : const WeatherContent(),
    );
  }
}

//-----------------------------------------------------------------------------------------------
// _Content
//-----------------------------------------------------------------------------------------------

class WeatherContent extends GetView<WeatherController> {
  const WeatherContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MainWeather(
            locationName: controller.name.value,
            temperature: controller.tempC.value,
            time: controller.createdAt.value,
          ),
          HourlyWeather(
            feeds: controller.feeds,
            field1: controller.field1.value,
            field2: controller.field2.value,
            field3: controller.field3.value,
          ),
        ],
      ),
    );
  }
}

class HourlyWeather extends GetView<WeatherController> {
  const HourlyWeather({
    required this.feeds,
    this.field1,
    this.field2,
    this.field3,
  });

  final List<WeatherFeed> feeds;
  final String? field1;
  final String? field2;
  final String? field3;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: feeds.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            width: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // hour
                MyText(text: controller.feeds[index].createdAt ?? "nan"),
                const SizedBox(height: 15),
                // weather icon image
                Image.asset(
                  'assets/images/weather.png',
                  height: 35,
                ),
                const SizedBox(height: 7),
                // field 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(text: field1 ?? "nun"),
                    MyText(text: feeds[index].field1 ?? "nun"),
                  ],
                ),
                const SizedBox(height: 7),
                // field 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(text: field2 ?? "nun"),
                    MyText(text: feeds[index].field2 ?? "nun"),
                  ],
                ),
                const SizedBox(height: 7),
                // field 3
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(text: field3 ?? "nun"),
                    MyText(text: feeds[index].field3 ?? "nun"),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

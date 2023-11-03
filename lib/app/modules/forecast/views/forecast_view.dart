// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/forecast_feed_model.dart';
import '../../shared/text.dart';
import '../../shared/weather_content.dart';
import '../controllers/forecast_controller.dart';

class ForecastView extends GetView<ForecastController> {
  const ForecastView();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.isLoading.value)
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : const ForecastContent(),
    );
  }
}

//-----------------------------------------------------------------------------------------------
// _Content
//-----------------------------------------------------------------------------------------------

class ForecastContent extends GetView<ForecastController> {
  const ForecastContent();
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MainWeather(
              locationName: controller.name.value,
              temperature: controller.tempC.value,
              time: controller.time.value,
            ),
            HourlyForecast(
              feeds: controller.feeds,
              field1: controller.field1.value,
              field2: controller.field2.value,
              field3: controller.field3.value,
              field4: controller.field4.value,
            ),
          ],
        ),
      ),
    );
  }
}

class HourlyForecast extends GetView<ForecastController> {
  const HourlyForecast({
    required this.feeds,
    this.field1,
    this.field2,
    this.field3,
    this.field4,
  });

  final List<ForecastFeed> feeds;
  final String? field1;
  final String? field2;
  final String? field3;
  final String? field4;

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
                MyText(text: feeds[index].field4 ?? "nan"),
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

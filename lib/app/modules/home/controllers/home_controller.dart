// ignore_for_file: unnecessary_overrides

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/enums/service_enum.dart';
import '../../../data/models/chien_model.dart';
import '../../../data/services/weather/weather_service_interface.dart';
import '../views/home_view.dart';
import 'package:intl/intl.dart';

import '../views/management_view.dart';

class HomeController extends GetxController {
  // declare service
  late final IWeatherService service;
  // bottom navigation bar current index
  var currentIndex = 0.obs;
  // status of homeview
  var isLoading = false.obs;

  // data of weather
  var name = "nun".obs;
  var field1 = "nan".obs;
  var field2 = "nan".obs;
  var field3 = "nan".obs;
  var createdAt = "nun".obs;
  var tempC = "nun".obs;

  // data of Feeds
  var feeds = <Feeds>[].obs;
  var sampleFeeds = [
    Feeds(
      field1: "nun",
      field2: "nun",
      field3: "nun",
      createdAt: "nun",
      entryId: 0,
    )
  ];
  // search controller
  var searchController = TextEditingController();
  // get service then fetch Weather of "Ho Chi Minh"
  @override
  void onInit() {
    service = Get.find<IWeatherService>(tag: ServiceEnum.WEATHER);
    // get weather for default city (Ho Chi Minh)
    getWeather();
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
  Future<void> getWeather() async {
    // show loading progress indicator
    isLoading(true);
    service.getChienWeather(60).then(
      (weather) {
        // check null
        if (weather.channel == null) return;
        if (weather.feeds == null) return;
        if (weather.feeds!.isEmpty) {
          feeds.value = sampleFeeds;
          return;
        }
        // data of weather
        name.value = weather.channel!.name ?? "nan";
        field1.value = weather.channel!.field1 ?? "nan";
        field2.value = weather.channel!.field2 ?? "nan";
        field3.value = weather.channel!.field3 ?? "nan";
        createdAt.value = weather.channel!.updatedAt ?? "nan";

        // data of feeds
        var feedsForView = <Feeds>[];
        for (var element in weather.feeds!) {
          // remove feeds have negative temp
          if (element.field1!.contains('-')) break;
          // add feed to new list
          feedsForView.add(
            Feeds(
              entryId: element.entryId,
              createdAt: utcToLocal(element.createdAt!),
              field1: convertTempCToString(element.field1!),
              field2: element.field2,
              field3: element.field3,
            ),
          );
        }
        feeds.value = feedsForView;
        // find closet date to now
        var now = DateTime.now();
        var closetsDateTimeToNow = feedsForView.reduce(
          (a, b) => DateTime.parse(a.createdAt!).difference(now).abs() <
                  DateTime.parse(b.createdAt!).difference(now).abs()
              ? a
              : b,
        );
        // data of weather (update)
        createdAt.value = closetsDateTimeToNow.createdAt!;
        tempC.value = closetsDateTimeToNow.field1!;
        // hide loading progress indicator
        isLoading(false);
      },
    ).onError((error, stackTrace) {
      // hide loading progress indicator
      showToast();
      log(error.toString());
      isLoading(false);
    });
  }

  onTapNavigator(int index) {
    if (index == 0) {
      currentIndex.value = index;
      Get.to(() => ForecastView());
    } else if (index == 1) {
      currentIndex.value = index;
      Get.to(() => HomeView());
    }
  }
}

String convertTempCToString(String temp) {
  var tempDouble = double.parse(temp);
  if (tempDouble.isNegative) {
    return "nan";
  }
  var newString = "${double.parse(temp).toStringAsFixed(1)}°";
  return newString;
}

String utcToLocal(String createdAt) {
  //"yyyy-MM-dd'T'HH:mm:ss'Z'"
  var newValue = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(createdAt);
  String result = DateFormat("yyyy-MM-dd HH:mm").format(newValue);
  return result;
}

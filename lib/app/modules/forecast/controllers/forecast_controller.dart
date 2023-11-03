// ignore_for_file: unnecessary_overrides, prefer_interpolation_to_compose_strings, avoid_print

import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/enums/service_enum.dart';
import '../../../data/models/forecast_feed_model.dart';
import '../../../data/services/forecast/forecast_service_interface.dart';
import '../../shared/convert.dart';
import '../../shared/toast.dart';

class ForecastController extends GetxController {
  final count = 0.obs;
  // declare service
  late final IForecastService service;
  // bottom navigation bar current index
  var currentIndex = 0.obs;
  // status of homeview
  var isLoading = false.obs;

  // data of weather
  var name = "nun".obs;
  var field1 = "nan".obs;
  var field2 = "nan".obs;
  var field3 = "nan".obs;
  var field4 = "nan".obs;
  var time = "nun".obs;
  var tempC = "nun".obs;

  // data of Feeds
  var feeds = <ForecastFeed>[].obs;
  var sampleFeeds = [
    ForecastFeed(
      field1: "nun",
      field2: "nun",
      field3: "nun",
      field4: "nun",
      createdAt: "nun",
      entryId: 0,
    )
  ];
  // search controller
  var searchController = TextEditingController();
  // get service then fetch Weather of "Ho Chi Minh"
  @override
  void onInit() {
    service = Get.find<IForecastService>(tag: ServiceEnum.FORECAST);
    getForecasts();
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
  Future<void> getForecasts() async {
    // show loading progress indicator
    isLoading(true);
    service.getForecasts(60).then(
      (forecast) {
        // check null
        if (forecast.channel == null) return;
        if (forecast.feeds == null) return;
        if (forecast.feeds!.isEmpty) {
          feeds.value = sampleFeeds;
          return;
        }
        // parse new list
        var feedsForView = parseForecastFeed(forecast.feeds!);
        // data of weather
        name.value = forecast.channel!.name ?? "nan";
        field1.value = forecast.channel!.field1 ?? "nan";
        field2.value = forecast.channel!.field2 ?? "nan";
        field3.value = forecast.channel!.field3 ?? "nan";
        field4.value = forecast.channel!.field4 ?? "nan";
        // sort list by date
        feedsForView = sortList(feedsForView);
        //
        feeds.value = feedsForView;
        // find closet date to now
        var closetsDateTimeToNow = findClosetDatetime(feedsForView);
        // data of weather (update)
        time.value = closetsDateTimeToNow.field4!;
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
}

// sort list by date
sortList(List<ForecastFeed>? feeds) {
  if (feeds == null) return;
  // log("before sort");
  // for (var element in feeds) {
  //   log(element.field4!);
  // }

  // sort
  feeds.sort((a, b) {
    return a.field4!.compareTo(b.field4!);
  });

  // remove duplicate date
  feeds.toSet().toList();
  // log("after sort");
  // for (var element in feeds) {
  //   log(element.field4!);
  // }
  return feeds;
}

parseForecastFeed(List<ForecastFeed>? feeds) {
  var newList = <ForecastFeed>[];
  for (var element in feeds!) {
    // remove feeds have negative temp
    if (element.field1!.contains('-')) break;
    if (element.field4 == null) break;
    if (checkAvailableDate(element.field4!)) {
      // add feed to new list
      newList.add(
        ForecastFeed(
          entryId: element.entryId,
          createdAt: element.createdAt!,
          field1: convertTempCToString(element.field1 ?? "30"),
          field2: convertPressureToString(element.field2!),
          field3: convertHumidityToString(element.field3!),
          field4: parseToLocalUTC(element.field4!),
        ),
      );
    }
  }

  if (newList.isEmpty) {
    newList = [
      ForecastFeed(
        field1: "nun",
        field2: "nun",
        field3: "nun",
        field4: "nun",
        createdAt: "nun",
        entryId: 0,
      )
    ];
  }
  return newList;
}

bool checkAvailableDate(String date) {
  var newValue = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
  newValue = DateTime(
    newValue.year,
    newValue.month,
    newValue.day,
    newValue.hour + 7,
    newValue.minute,
  );
  if (newValue.isAfter(DateTime.now())) {
    return true;
  } else {
    log("elimited" + newValue.toString());
    return false;
  }
}

String parseToLocalUTC(String date) {
  // log("string: " + date);
  var newValue = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
  // log("parse to date: " + newValue.toString());
  newValue = DateTime(
    newValue.year,
    newValue.month,
    newValue.day,
    newValue.hour + 7,
    newValue.minute,
  );
  // log("add 7 hours: " + newValue.toString());
  String result = DateFormat("yyyy-MM-dd HH:mm").format(newValue);
  // log("format : " + result);
  return result;
}

findClosetDatetime(List<ForecastFeed> feeds) {
  var now = DateTime.now();
  var closetsDateTimeToNow = feeds.reduce(
    (a, b) => DateTime.parse(a.field4 ?? now.toString()).difference(now).abs() <
            DateTime.parse(b.field4 ?? now.toString()).difference(now).abs()
        ? a
        : b,
  );
  return closetsDateTimeToNow;
}

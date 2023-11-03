import 'package:get/get.dart';
import 'package:intl/intl.dart';
// ignore_for_file: unnecessary_overrides

import 'dart:developer';

import '../../../data/enums/service_enum.dart';
import '../../../data/models/models.dart';
import '../../../data/services/weather/weather_service_interface.dart';
import '../../shared/convert.dart';
import '../../shared/toast.dart';

class WeatherController extends GetxController {
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
  var feeds = <WeatherFeed>[].obs;
  var sampleFeeds = [
    WeatherFeed(
      field1: "nun",
      field2: "nun",
      field3: "nun",
      createdAt: "nun",
      entryId: 0,
    )
  ];

  @override
  void onInit() {
    service = Get.find<IWeatherService>(tag: ServiceEnum.WEATHER);
    getWeathers();
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
  Future<void> getWeathers() async {
    // show loading progress indicator
    isLoading(true);
    service.getWeathers(60).then(
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
        var feedsForView = <WeatherFeed>[];
        for (var element in weather.feeds!) {
          // remove feeds have negative temp
          if (element.field1!.contains('-')) break;
          // add feed to new list
          feedsForView.add(
            WeatherFeed(
              entryId: element.entryId,
              createdAt: toLocalDate(element.createdAt!),
              field1: convertTempCToString(element.field1!),
              field2: convertHumidityToString(element.field2!),
              field3: convertPressureToString(element.field3!),
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
}

String toLocalDate(String createdAt) {
  //"yyyy-MM-dd'T'HH:mm:ss'Z'"
  var newValue = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(createdAt);
  newValue = DateTime(
    newValue.year,
    newValue.month,
    newValue.day,
    newValue.hour + 7,
    newValue.minute,
  );
  String result = DateFormat("yyyy-MM-dd HH:mm").format(newValue);
  return result;
}

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/convert_data.dart';
import '../controllers/home_controller.dart';
import 'management_view.dart';

/// Home Weather View
class HomeView extends GetView<HomeController> {
  const HomeView();
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              MainWeather(),
              HourlyWeather(),
              SizedBox(height: 20),
              DailyWeather()
            ],
          ),
        ),
      ),
    );
  }
}

/// Main Weather Widget
class MainWeather extends GetView<HomeController> {
  const MainWeather({super.key});

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PopupMenuButton<String>(
                        color: Colors.blue,
                        icon: Image.asset(
                          "assets/images/menu8.png",
                          color: Colors.white,
                          height: 25,
                        ),
                        offset: Offset(0, 50),
                        itemBuilder: (BuildContext context) {
                          return <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'Option 1',
                              child: const Text(
                                'Manage cities',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                Get.to(() => const ManagementView());
                              },
                            ),
                          ];
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),

                  // city name text
                  Text(
                    controller.location.value.name!,
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
                          convertTempCToString(controller.current.value.tempC!),
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
                    controller.current.value.condition!.text!,
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

/// List Hourly Weather Widget
class HourlyWeather extends GetView<HomeController> {
  const HourlyWeather();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: 400,
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: (controller.isLoading.value)
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.hour.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // hour
                        Text(
                          controller.hour[index].time!.substring(11, 16),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        // weather icon image
                        Image.network(
                          height: 35,
                          "https:${controller.hour[index].condition!.icon!}",
                          errorBuilder: (context, exception, stackTrace) {
                            return Image.asset(
                              'assets/images/weather.png',
                              height: 35,
                            );
                          },
                        ),
                        const SizedBox(height: 2),
                        // current temperature in celsius text
                        Text(
                          convertTempCToString(controller.hour[index].tempC!),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}

/// List Daily Weather Widget
class DailyWeather extends GetView<HomeController> {
  const DailyWeather();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: 400,
        height: 170,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: (controller.isLoading.value)
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.forecastday.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // date
                        Text(
                          controller.forecastday[index].date!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // weather icon image
                        Image.network(
                          height: 35,
                          "https:${controller.forecastday[index].day!.condition!.icon!}",
                          errorBuilder: (context, exception, stackTrace) {
                            return Image.asset(
                              'assets/images/weather.png',
                              height: 35,
                            );
                          },
                        ),
                        const SizedBox(height: 5),
                        // weather condition text
                        Text(
                          "${controller.forecastday[index].day!.condition!.text}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        // max temperature in celsius text
                        Text(
                          "Max ${convertTempCToString(controller.forecastday[index].day!.maxtempC!)}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        // min temperature in celsius text
                        Text(
                          "Min ${convertTempCToString(controller.forecastday[index].day!.mintempC!)}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        // const SizedBox(height: 10),
                        // Text(
                        //   "Wind ${controller.forecastday[index].day!.maxwindKph} km/h",
                        //   style: const TextStyle(
                        //     fontSize: 14,
                        //     color: Colors.white,
                        //   ),
                        // ),
                        // const SizedBox(height: 10),
                        // // sunrise time
                        // Text(
                        //   "Sunrise: ${controller.forecastday[index].astro!.sunrise!}",
                        //   style: const TextStyle(
                        //     fontSize: 14,
                        //     color: Colors.white,
                        //   ),
                        // ),
                        // const SizedBox(height: 10),
                        // // sunset time
                        // Text(
                        //   "Sunset: ${controller.forecastday[index].astro!.sunset!}",
                        //   style: const TextStyle(
                        //     fontSize: 14,
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}

/// Show Invalid Location Toast
void showToast() {
  Fluttertoast.showToast(
    msg: "No matching location found",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

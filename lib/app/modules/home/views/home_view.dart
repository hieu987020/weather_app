// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              // DailyWeather()
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

// List Hourly Weather Widget
class HourlyWeather extends GetView<HomeController> {
  const HourlyWeather();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: 400,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: (controller.isLoading.value)
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.feeds.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // hour
                        MyText(
                            text: controller.feeds[index].createdAt ?? "nan"),

                        const SizedBox(height: 15),
                        // weather icon image
                        Image.asset(
                          'assets/images/weather.png',
                          height: 35,
                        ),
                        const SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(text: controller.field1.value),
                            MyText(
                                text: controller.feeds[index].field1 ?? "nun"),
                          ],
                        ),
                        const SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(text: controller.field2.value),
                            MyText(
                                text: controller.feeds[index].field2 ?? "nun"),
                          ],
                        ),
                        const SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(text: controller.field3.value),
                            MyText(
                                text: controller.feeds[index].field3 ?? "nun"),
                          ],
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

class MyText extends StatelessWidget {
  const MyText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.white,
        overflow: TextOverflow.ellipsis,
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

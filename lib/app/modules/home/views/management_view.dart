import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/home/controllers/home_controller.dart';

class ManagementView extends GetView<HomeController> {
  const ManagementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var suggestion = [
      "Ho Chi Minh",
      "Da Nang",
      "Ha Noi",
      "Tokyo",
      "Kyoto",
      "Chicago",
      "Portland",
      "New York",
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Manage cities"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onSubmitted: (value) {
                  controller.searchWeather(value);
                  Get.back();
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Example cities ",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 400,
              height: 700,
              child: ListView.builder(
                itemCount: suggestion.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        controller.searchWeather(suggestion[index]);
                        Get.back();
                      },
                      child: Text(
                        suggestion[index],
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

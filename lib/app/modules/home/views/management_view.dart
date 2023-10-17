import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/modules/home/controllers/home_controller.dart';

class ManagementView extends GetView<HomeController> {
  const ManagementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Manage cities"),
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus(); // Dismiss the keyboard
          }
        },
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
                onChanged: (value) {
                  // controller.searchWeather(value);
                },
                onSubmitted: (value) {
                  controller.searchWeather(value);
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

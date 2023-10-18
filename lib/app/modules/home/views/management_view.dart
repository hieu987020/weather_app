// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

// Management View
class ManagementView extends GetView<HomeController> {
  const ManagementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Container(
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
          child: Column(
            children: [
              const SizedBox(height: 30),

              // back icon button and search icon button
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 12, right: 12),
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          controller: searchController,
                          onTapOutside: (event) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                            ),
                            prefixIconColor: Colors.white.withOpacity(0.6),
                            prefixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {
                                controller.searchWeather(searchController.text);
                              },
                            ),
                            suffixIconColor: Colors.white.withOpacity(0.6),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                searchController.clear();
                              },
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          onSubmitted: (value) {
                            controller.searchWeather(value);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // suggested cities
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "SUGGESTED CITIES",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Wrap(
                        children: listView(),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // generate list suggested cities widget
  List<Widget> listView() {
    var list = <Widget>[];
    var suggestion = [
      'Hanoi',
      'Ho Chi Minh City',
      'Da Nang',
      'Hai Phong',
      'Can Tho',
      'Bien Hoa',
      'Hue',
      'Nha Trang',
      'Buon Ma Thuot',
      'Vung Tau',
      'Hai Duong',
      'Phan Thiet',
      'Cam Pha',
      'Qui Nhon',
      'Rach Gia',
      'Long Xuyen',
      'Tan An',
      'Yen Bai',
      'Tuy Hoa',
      'Dong Hoi',
      'Vinh Yen',
      'My Tho',
      'Ben Tre',
      'Tam Ky',
      'Soc Trang',
      'Pleiku',
      'Yen Vinh',
      'Vi Thanh',
      'Sa Dec',
      'Lao Cai',
      'Son Tay',
      'Nam Dinh',
      'Bac Giang',
      'Thai Nguyen',
      'Phu Ly',
      'Ca Mau',
      'Quang Ngai',
      'Vinh',
      'Dong Ha',
      'Hoa Binh',
      'Thanh Hoa',
      'Bac Ninh',
      'Alabama',
      'Alaska',
      'Arizona',
      'Arkansas',
      'California',
      'Colorado',
      'Connecticut',
      'Delaware',
      'Maryland',
      'Massachusetts',
      'Michigan',
      'Minnesota',
      'Mississippi',
      'Missouri',
      'Montana',
      'Nebraska',
      'Nevada',
      'New Hampshire'
    ];
    for (var element in suggestion) {
      list.add(SuggestedCities(city: element));
    }
    return list;
  }
}

// Suggested Cities Widget
class SuggestedCities extends GetView<HomeController> {
  const SuggestedCities({required this.city});
  final String city;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: GestureDetector(
        onTap: () {
          controller.searchWeather(city);
          Get.back();
        },
        child: Text(
          city.toUpperCase(),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

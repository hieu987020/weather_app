// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'management_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black,
                Colors.blueGrey,
              ],
            ),
          ),
          child: Obx(
            () => (controller.isLoading.value == true)
                ? const SizedBox(
                    height: 800,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          PopupMenuButton<String>(
                            itemBuilder: (BuildContext context) {
                              return <PopupMenuEntry<String>>[
                                PopupMenuItem<String>(
                                  value: 'Option 1',
                                  child: const Text('Manage cities'),
                                  onTap: () {
                                    Get.to(() => const ManagementView());
                                  },
                                ),
                              ];
                            },
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(height: 80),
                      Text(
                        controller.name.value,
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Text(
                              controller.tempc.value,
                              style: const TextStyle(
                                fontSize: 96,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        controller.condition.value,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        height: 700,
                        child: WeatherForecast(),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

// Fake data forecast
class WeatherForecast extends GetView<HomeController> {
  WeatherForecast();

  final List<Map<String, dynamic>> fakeData = [
    {'day': 'Monday', 'temp': '23°C', 'icon': Icons.wb_sunny},
    {'day': 'Tuesday', 'temp': '25°C', 'icon': Icons.wb_sunny},
    {'day': 'Wednesday', 'temp': '19°C', 'icon': Icons.cloud},
    {'day': 'Thursday', 'temp': '21°C', 'icon': Icons.wb_sunny},
    {'day': 'Friday', 'temp': '20°C', 'icon': Icons.cloud},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: fakeData.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Icon(fakeData[index]['icon']),
            title: Text(fakeData[index]['day']),
            trailing: Text(fakeData[index]['temp']),
            onTap: () {},
          ),
        );
      },
    );
  }
}
// class ForecastView extends GetView<HomeController> {
//   const ForecastView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 360,
//       height: 150,
//       padding: const EdgeInsets.all(10),
//       margin: const EdgeInsets.all(10),
//       color: Colors.blueGrey,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         shrinkWrap: true,
//         itemCount: controller.hour.length,
//         itemBuilder: (BuildContext context, int index) {
//           print(controller.hour[index].condition!.icon!);
//           return SizedBox(
//             width: 50,
//             height: 50,
//             child: Column(
//               children: [
//                 Text(
//                   controller.hour[index].time!.substring(11, 16),
//                   style: const TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Image.network(
//                   controller.hour[index].condition!.icon!,
//                   fit: BoxFit.contain,
//                   height: 50,
//                 ),
//                 Text(
//                   "${controller.hour[index].tempC}" "°",
//                   style: const TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

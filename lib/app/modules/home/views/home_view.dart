import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'management_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
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
              ? const Center(
                  child: CircularProgressIndicator(),
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
                          onSelected: (String choice) {},
                          itemBuilder: (BuildContext context) {
                            return <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'Option 1',
                                child: const Text('Manage cities'),
                                onTap: () {
                                  Get.to(() => const ManagementView());
                                },
                              ),
                              const PopupMenuItem<String>(
                                value: 'Option 2',
                                child: Text('Option 2'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'Option 3',
                                child: Text('Option 3'),
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
                    Text(
                      controller.tempc.value,
                      style: const TextStyle(
                        fontSize: 86,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      controller.condition.value,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

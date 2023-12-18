// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.blue,
        body: _getView(controller.currentIndex.value),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Today',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Forecast',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Account',
              ),
            ],
            onTap: (index) => controller.onTapNavigator(index),
          ),
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------------------------------------
// _Helpers
//-----------------------------------------------------------------------------------------------

Widget _getView(int index) {
  Widget view;
  switch (index) {
    case 0:
      view = AppPages.page[Routes.WEATHER] as Widget;
      break;
    case 1:
      view = AppPages.page[Routes.FORECAST] as Widget;
      break;
    case 2:
      view = AppPages.page[Routes.ACCOUNT] as Widget;
      break;
    default:
      view = AppPages.page[Routes.HOME] as Widget;
  }
  return view;
}

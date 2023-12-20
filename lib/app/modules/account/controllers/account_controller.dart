// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountController extends GetxController {
  var currentIndex = 0.obs;
  var isLoading = false.obs;

  var name = 'User'.obs;

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('current');
    name.value = username ?? 'User';
    isLoading.value = false;
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
}

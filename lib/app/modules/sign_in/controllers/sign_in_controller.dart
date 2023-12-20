// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool showMessage = false.obs;
  RxString message = ''.obs;
  Rx<TextEditingController> username = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    print("onClose SignInController");
    super.onClose();
  }

  Future<void> signIn() async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(username.value.text)) {
      // account does not exist
      message.value = 'Account does not exist. Enter a different account.';
      showMessage.value = true;
    } else {
      // account exists
      if (prefs.getString(username.value.text) != password.value.text) {
        // account incorrect (wrong username or password)
        showMessage.value = true;
        message.value = 'Incorrect username or password.';
      } else {
        // account correct
        prefs.setString('current', username.value.text);
        Get.offAllNamed('/home');
      }
    }
    isLoading.value = false;
  }
}

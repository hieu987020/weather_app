// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
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
    username.value.dispose();
    password.value.dispose();
    print("onClose SignUpController");
    super.onClose();
  }

  Future<void> signUp(BuildContext context) async {
    isLoading.value = true;
    // avoid block context in asynchronous
    var currentContext = context;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(username.value.text)) {
      // account adready exists
      message.value = 'Account adready exists.';
      showMessage.value = true;
    } else {
      // account does not exist
      await prefs.setString(username.value.text, password.value.text);
      Get.offAllNamed('/sign_in');
      showSnackBar(currentContext, 'Create account successfully!');
    }
    isLoading.value = false;
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

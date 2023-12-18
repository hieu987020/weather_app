// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

class AccountController extends GetxController {
  var currentIndex = 0.obs;
  var isLoading = false.obs;
  var isSignIn = false.obs;
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
    super.onClose();
  }

  void signIn() {
    isLoading.value = true;
    isSignIn(true);
    isLoading.value = false;
  }

  void signOut() {
    isLoading.value = true;
    isSignIn(false);
    isLoading.value = false;
  }
}

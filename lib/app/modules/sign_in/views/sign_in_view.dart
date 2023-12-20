// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../shared/custom_button.dart';
import '../../shared/custom_textfield.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.isLoading.value)
          ? Scaffold(
              body: const Center(
                  child: CircularProgressIndicator(color: Colors.blue)))
          : const SignInContent(),
    );
  }
}

//-----------------------------------------------------------------------------------------------
// _Content
//-----------------------------------------------------------------------------------------------

class SignInContent extends GetView<SignInController> {
  const SignInContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(
        child: SignIn(),
      ),
    );
  }
}

class SignIn extends GetView<SignInController> {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        SizedBox(
          height: 120,
          child: Image.asset('assets/images/weather-app.png'),
        ),
        const SizedBox(height: 50),
        Text(
          "Sign In",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Text("Hi! Welcome back, you've been missed"),
        const SizedBox(height: 70),
        CustomeTextField(
          hintText: 'Username',
          prefixIcon: Icon(Icons.verified_user),
          obscureText: false,
          controller: controller.username.value,
        ),
        const SizedBox(height: 20),
        CustomeTextField(
          hintText: 'Password',
          prefixIcon: Icon(Icons.verified_user),
          obscureText: true,
          controller: controller.password.value,
        ),
        Obx(
          () => (controller.showMessage.value)
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    controller.message.value,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ),
        const SizedBox(height: 30),
        CustomButton(
          text: 'Sign In',
          onPressed: () => controller.signIn(),
        ),
        const SizedBox(height: 50),
        RichText(
          text: TextSpan(
            text: "Don't have an account? ",
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: 'Sign Up',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.offAllNamed('/sign_up');
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../shared/custom_button.dart';
import '../../shared/custom_textfield.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.isLoading.value)
          ? Scaffold(
              body: const Center(
                  child: CircularProgressIndicator(color: Colors.blue)))
          : const SignUpContent(),
    );
  }
}

//-----------------------------------------------------------------------------------------------
// _Content
//-----------------------------------------------------------------------------------------------

class SignUpContent extends GetView<SignUpController> {
  const SignUpContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(
        child: SignUp(),
      ),
    );
  }
}

class SignUp extends GetView<SignUpController> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        SizedBox(
          height: 120,
          child: Image.asset('assets/images/create.png'),
        ),
        const SizedBox(height: 50),
        Text(
          "Create Account",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Text("Fill your information below."),
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
          text: 'Sign Up',
          onPressed: () => controller.signUp(context),
        ),
        const SizedBox(height: 50),
        RichText(
          text: TextSpan(
            text: "Already have an account? ",
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: 'Sign In',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.offAllNamed('/sign_in');
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

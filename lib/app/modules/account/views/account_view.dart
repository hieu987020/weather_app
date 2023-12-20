// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/modules/shared/custom_button.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.isLoading.value)
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : const AccountContent(),
    );
  }
}

//-----------------------------------------------------------------------------------------------
// _Content
//-----------------------------------------------------------------------------------------------

class AccountContent extends GetView<AccountController> {
  const AccountContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: const AccountDetail());
  }
}

class AccountDetail extends GetView<AccountController> {
  const AccountDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 20),
              CircleAvatar(
                maxRadius: 40,
                child: Image.asset('assets/images/man.png'),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      controller.name.value,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Ho Chi Minh, Viet Nam',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 100),
          CustomButton(
            text: 'Sign Out',
            onPressed: () => Get.offAllNamed('/sign_in'),
          ),
        ],
      ),
    );
  }
}

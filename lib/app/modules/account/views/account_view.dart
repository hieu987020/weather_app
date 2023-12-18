// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/models.dart';
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
    return Obx(
      () => SingleChildScrollView(
        child: (controller.isSignIn.value)
            ? const AccountDetail()
            : const SignIn(),
      ),
    );
  }
}

class SignIn extends GetView<AccountController> {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    void _signIn() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', 'chien');
      prefs.setString('password', 'chien');
      String savedEmail = prefs.getString('username') ?? '';
      String savedPassword = prefs.getString('password') ?? '';

      if (_emailController.text == savedEmail &&
          _passwordController.text == savedPassword) {
        // Successful sign-in
        // Implement additional sign-in logic if needed

        // Navigate to the home screen or perform other actions
        Navigator.pop(context); // Go back to the previous screen
      } else {
        // Incorrect credentials
        // Implement error handling or display a message
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        SizedBox(
          height: 200,
          child: Image.asset('assets/images/weather-app.png'),
        ),
        const SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(fontSize: 17),
                  hintText: 'Username',
                  prefixIcon: Icon(Icons.verified_user),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                ),
                controller: _emailController,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          width: 350,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
          ),
          child: TextField(
            decoration: const InputDecoration(
              hintStyle: TextStyle(fontSize: 17),
              hintText: 'Password',
              prefixIcon: Icon(Icons.verified_user),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(20),
            ),
            controller: _passwordController,
            obscureText: true,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: 350,
          height: 70,
          child: ElevatedButton(
            onPressed: () => controller.signIn(),
            // onPressed: _signIn,
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle?>(
                  const TextStyle(fontSize: 24)),
              foregroundColor: MaterialStateProperty.all<Color?>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color?>(Colors.black),
            ),
            child: const Text('Sign In'),
          ),
        ),
      ],
    );
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
                  Text(
                    'Mr Chien',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
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
          const SizedBox(height: 400),
          Container(
            width: 350,
            height: 70,
            child: ElevatedButton(
              onPressed: () => controller.signOut(),
              // onPressed: _signIn,
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle?>(
                    const TextStyle(fontSize: 24)),
                foregroundColor:
                    MaterialStateProperty.all<Color?>(Colors.white),
                // overlayColor: MaterialStateProperty.all<Color?>(Colors.black),
                backgroundColor:
                    MaterialStateProperty.all<Color?>(Colors.black),
              ),
              child: const Text('Sign Out'),
            ),
          ),
        ],
      ),
    );
  }
}

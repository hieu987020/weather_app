import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.obscureText,
  });

  final TextEditingController controller;
  final String hintText;
  final Widget prefixIcon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: const TextStyle(fontSize: 14),
                  hintText: hintText,
                  prefixIcon: prefixIcon,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(20),
                ),
                style: const TextStyle(fontSize: 14),
                controller: controller,
                obscureText: obscureText,
              ),
            ),
          ),
        ],
      ),
      // ),
    );
  }
}

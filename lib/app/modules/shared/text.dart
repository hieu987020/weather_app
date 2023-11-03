
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.white,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

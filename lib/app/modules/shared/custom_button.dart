import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle?>(
                  const TextStyle(fontSize: 20),
                ),
                foregroundColor:
                    MaterialStateProperty.all<Color?>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color?>(Colors.black),
                shape: MaterialStateProperty.all<OutlinedBorder?>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                minimumSize:
                    MaterialStateProperty.all<Size?>(const Size(100, 60)),
              ),
              child: Text(text),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color? buttonColor;
  final VoidCallback onPress;

  const MyButton(
      {required this.title,
      this.buttonColor,
      required this.onPress,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: buttonColor,
            ),
            child: Center(
              child: Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}

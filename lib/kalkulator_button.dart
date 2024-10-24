import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        padding: const EdgeInsets.all(13),
        backgroundColor: color,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

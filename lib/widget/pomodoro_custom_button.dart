import 'package:flutter/material.dart';

class PomodoroCustomButton extends StatelessWidget {
  final void Function() onTap;
  final String text;

  const PomodoroCustomButton({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 200,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

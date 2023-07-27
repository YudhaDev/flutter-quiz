import 'package:flutter/material.dart';

class ButtonAnswer extends StatelessWidget {
  const ButtonAnswer(
      {super.key, required this.textButton, required this.onClick});

  final String textButton;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            backgroundColor: Colors.amber,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: Text(textButton));
  }
}

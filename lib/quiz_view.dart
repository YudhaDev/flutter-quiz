import 'package:flutter/material.dart';
import 'package:quiz_app/button_answer.dart';

class QuizView extends StatefulWidget {
  QuizView({super.key});

  @override
  State<QuizView> createState() {
    return _QuizViewState();
  }
}

class _QuizViewState extends State<QuizView> {
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Pertanyaan",
          style: TextStyle(color: Colors.white70),
        ),
        Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text("Jawaban:"),
            SizedBox(
              height: 30,
            ),
            ButtonAnswer(textButton: "icikiwir", onClick: () {}),
            ButtonAnswer(textButton: "icikiwir", onClick: () {}),
            ButtonAnswer(textButton: "icikiwir", onClick: () {}),
            ButtonAnswer(textButton: "icikiwir", onClick: () {}),
          ],
        )
      ],
    );
  }
}

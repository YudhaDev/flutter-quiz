import 'package:flutter/material.dart';
import 'package:quiz_app/button_answer.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key, required this.simpanjawabanUser});

  final void Function(String jawaban) simpanjawabanUser;

  @override
  State<QuizView> createState() {
    return _QuizViewState();
  }
}

class _QuizViewState extends State<QuizView> {
  var current_question_index = 0;

  incrementQuestionIndex(String jawaban) {
    widget.simpanjawabanUser(jawaban);
    setState(() {
      current_question_index += 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[current_question_index];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          currentQuestion.text,
          style: GoogleFonts.inter(color: Colors.white60),
        ),
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text("Jawaban:"),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...currentQuestion.RandomPositionAnswer().map((answer) {
                    return ButtonAnswer(
                        textButton: answer,
                        onClick: () {
                          incrementQuestionIndex(answer);
                        });
                  }),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz_main.dart';

class QuizEnds extends StatefulWidget {
  QuizEnds(
      {super.key,
      required int this.jawaban_yang_benar,
      required this.restartQuiz,
      required this.jawaban_user});

  final int jawaban_yang_benar;
  final List<String> jawaban_user;
  final void Function() restartQuiz;
  List<Map<String, Object>> summary = [];

  void prepareMapData() {
    for (var i = 0; i < questions.length; i++) {
      summary.add({
        'index_pertanyaan': i,
        'pertanyaan': questions[i].text,
        'jawaban_benar': questions[i].answers[0],
        'jawaban_user': jawaban_user[i]
      });
    }
  }

  @override
  State<StatefulWidget> createState() {
    return _QuizEndState();
  }
}

class _QuizEndState extends State<QuizEnds> {
  @override
  Widget build(BuildContext context) {
    widget.prepareMapData();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Quiz berakhir, jawaban yang benar:"),
        Text(widget.jawaban_yang_benar.toString()),
        const SizedBox(
          height: 30,
        ),
        Text("List jawaban.."),
        Column(
          children: [
            ...widget.summary.map((item) {
              return Text(item["jawaban_user"].toString());
            })
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () {
              widget.restartQuiz();
            },
            child: Text("Mulai Quiz lagi."))
      ],
    );
  }
}

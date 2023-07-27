import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz_start_view.dart';
import 'package:quiz_app/quiz_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz_app/quiz_ends.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> list_jawaban_pilihan_user = [];
  Widget? viewNow;

  @override
  void initState() {
    viewNow = StartView(toQuiz);
    super.initState();
  }

  void simpanJawabanUser(String jawabanUser) {
    list_jawaban_pilihan_user.add(jawabanUser);
    Fluttertoast.showToast(
        msg: list_jawaban_pilihan_user.toString(),
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG);

    if (list_jawaban_pilihan_user.length == questions.length) {
      var jawaban_yang_benar = 0;
      for (var (index, String jawaban) in list_jawaban_pilihan_user.indexed) {
        if (jawaban == questions[index].answers[0]) {
          jawaban_yang_benar += 1;
        }
      }
      setState(() {
        viewNow = QuizEnds(
          jawaban_yang_benar: jawaban_yang_benar,
          restartQuiz: restartQuiz,
          jawaban_user: list_jawaban_pilihan_user,
        );
      });
    }
  }

  void restartQuiz() {
    list_jawaban_pilihan_user = [];
    setState(() {
      viewNow = StartView(toQuiz);
    });
  }

  void toQuiz() {
    setState(() {
      viewNow = QuizView(
        simpanjawabanUser: simpanJawabanUser,
      );
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 255, 195, 160),
            Color.fromARGB(255, 255, 175, 189)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Center(child: viewNow),
        ),
      ),
      theme: ThemeData(primaryColor: Color.fromARGB(255, 255, 195, 160)),
    );
  }
}

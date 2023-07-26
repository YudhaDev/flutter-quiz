import 'package:flutter/material.dart';
import 'package:quiz_app/start_view.dart';
import 'package:quiz_app/quiz_view.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? viewNow;

  @override
  void initState() {
    viewNow = StartView(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      viewNow = QuizView();
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

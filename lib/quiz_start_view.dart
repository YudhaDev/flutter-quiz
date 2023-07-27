import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StartView extends StatelessWidget {
  const StartView(this.switchScreen, {key}) : super(key: key);

  // final Color color_start;
  // final Color color_end;
  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      SvgPicture.asset(
        'assets/images/quiz_img1.svg',
        semanticsLabel: 'a Vector Image',
        width: 300,
        height: 300,
      ),
      const SizedBox(
        height: 100,
      ),
      const Text("Aplikasi Quiz dengan menggunakan Flutter."),
      const SizedBox(
        height: 10,
      ),
      ElevatedButton(
          onPressed: () {
            switchScreen();
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [Text("Mulai Quiz"), Icon(Icons.arrow_right)],
          ))
    ]);
  }
}

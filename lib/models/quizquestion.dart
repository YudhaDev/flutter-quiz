class QuizQuestion {
  QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> RandomPositionAnswer() {
    final RandomedAnswer = List.of(answers);
    RandomedAnswer.shuffle();
    return RandomedAnswer;
  }
}

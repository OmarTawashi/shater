class TypingAnswer {
  String? text;
  int index = 0;
  List<TypingAnswer> subAnswers = [];
  String? input;
  bool isValid = false;
  bool isNumber = false;
  String? valid;
  double width = 1.0;
  int row = 0;

  TypingAnswer({
    this.text,
    this.index = 0,
    this.subAnswers = const [],
    this.input,
    this.isValid = false,
    this.isNumber = false,
    this.valid,
    this.width = 1.0,
    this.row = 0,
  });
}

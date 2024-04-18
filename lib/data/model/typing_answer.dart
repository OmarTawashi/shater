

import 'package:flutter/material.dart';

class TypingAnswer {
  String? text;
  int index = 0;
  TextEditingController? textEditingController;
  List<TypingAnswer> subAnswer ;
  dynamic input;
  bool isValid = false;
  bool isNumber = false;
  String? valid;
  double width = 1.0;
  int row = 0;

  TypingAnswer({
    this.text,
    this.index = 0,
    this.subAnswer =const [],
    this.input,
    this.isValid = false,
    this.isNumber = false,
    this.valid,
    this.textEditingController,
    this.width = 1.0,
    this.row = 0,
  });
}

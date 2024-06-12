// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TypingAnswer {
  String? text;
  int index = 0;
  TextEditingController? textEditingController;
  List<TypingAnswer> subAnswer;
  dynamic input;
  Color? backgroundColor;
  bool isValid = false;
  bool isNumber = false;
  String? valid;
  double width = 1.0;
  int row = 0;

  TypingAnswer({
    this.text,
    this.index = 0,
    this.subAnswer = const [],
    this.input,
    this.backgroundColor,
    this.isValid = false,
    this.isNumber = false,
    this.valid,
    this.textEditingController,
    this.width = 1.0,
    this.row = 0,
  });
}

class ArithmiticAnswer implements TypingAnswer {
  String? inputField;

  @override
  int index;

  @override
  var input;

  @override
  bool isNumber;

  @override
  bool isValid;

  @override
  int row;

  List<ArithmiticAnswer> subAnswerArthimitc;

  @override
  String? text;

  @override
  TextEditingController? textEditingController;

  @override
  String? valid;

  @override
  double width;
  ArithmiticAnswer({
    this.inputField,
    this.index = 0,
    this.row = 0,
    this.subAnswerArthimitc = const [],
    this.subAnswer = const [],
    this.input,
    this.isValid = false,
    this.isNumber = false,
    this.text,
    this.textEditingController,
    this.backgroundColor,
    this.valid,
    this.width = 1,
  });

  @override
  List<TypingAnswer> subAnswer;

  @override
  Color? backgroundColor;
}

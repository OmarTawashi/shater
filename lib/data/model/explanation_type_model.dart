import 'package:flutter/material.dart';

class ExplanationTypeModel {
  String? title;
  bool isSelected;
  List<Widget>? widgets;

  ExplanationTypeModel({
    this.title,
    this.widgets,
    this.isSelected = false,
  });
}

import 'package:flutter/material.dart';
import 'package:shater/util/color.dart';

enum QuestionStatusEnum { success, failure, select, none }

extension QuestionStatusExt on int {
  QuestionStatusEnum toOrderStatusEnum() {
    switch (this) {
      case 0:
        return QuestionStatusEnum.failure;
      case 1:
        return QuestionStatusEnum.success;
      default:
        return QuestionStatusEnum.none;
    }
  }
}

extension QuestionStatusColorExt on QuestionStatusEnum {
  Color getGridItemColor() {
    switch (this) {
      case QuestionStatusEnum.failure:
        return Color.fromRGBO(233, 103, 111, 1);
      case QuestionStatusEnum.success:
        return const Color.fromRGBO(106, 209, 0, 1);
      case QuestionStatusEnum.select:
        return COLORS.primaryColor;
      case QuestionStatusEnum.none:
        return Colors.transparent;
    }
  }

  Color getBgButtColor() {
    switch (this) {
      case QuestionStatusEnum.failure:
        return Color.fromRGBO(233, 103, 111, 1);
      case QuestionStatusEnum.success:
        return const Color.fromRGBO(106, 209, 0, 1);
      case QuestionStatusEnum.select:
        return COLORS.primaryColor;
      case QuestionStatusEnum.none:
        return Colors.grey;
    }
  }

  String getTextStatus() {
    switch (this) {
      case QuestionStatusEnum.failure:
        return 'false';
      case QuestionStatusEnum.success:
        return 'true';
      case QuestionStatusEnum.select:
        return '';
      case QuestionStatusEnum.none:
        return '';
    }
  }

  Widget getHeaderWidget(
      Widget successWidget, Widget failureWidget, Widget stableWidget) {
    switch (this) {
      case QuestionStatusEnum.failure:
        return failureWidget;
      case QuestionStatusEnum.success:
        return successWidget;
      case QuestionStatusEnum.select:
        return stableWidget;
      case QuestionStatusEnum.none:
        return stableWidget;
    }
  }
}

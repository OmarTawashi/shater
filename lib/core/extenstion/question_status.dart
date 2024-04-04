import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
import 'package:shater/util/color.dart';

enum QuestionStatusEnum { success, failure, select, skip, none }

extension QuestionStatusColorExt on QuestionStatusEnum {
  Color getGridItemColor() {
    switch (this) {
      case QuestionStatusEnum.failure:
        return Color.fromRGBO(233, 103, 111, 1);
      case QuestionStatusEnum.success:
        return const Color.fromRGBO(106, 209, 0, 1);
      case QuestionStatusEnum.select:
        return COLORS.primaryColor;
      case QuestionStatusEnum.skip:
        return COLORS.primaryColor;
      case QuestionStatusEnum.none:
        return Colors.transparent;
    }
  }

  Color getBorderFieldColor() {
    switch (this) {
      case QuestionStatusEnum.failure:
        return Color.fromRGBO(233, 103, 111, 1);
      case QuestionStatusEnum.success:
        return const Color.fromRGBO(106, 209, 0, 1);
      case QuestionStatusEnum.select:
        return COLORS.primaryColor;
      case QuestionStatusEnum.skip:
        return COLORS.primaryColor;
      case QuestionStatusEnum.none:
        return COLORS.primaryColor;
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
      case QuestionStatusEnum.skip:
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
      case QuestionStatusEnum.skip:
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
      case QuestionStatusEnum.skip:
        return stableWidget;
      case QuestionStatusEnum.none:
        return stableWidget;
    }
  }

  Function()? getOnPressButton(
      {Function()? onPressedSuccess,
      Function()? onPressedFailure,
      Function()? onPressedStable,
      Function()? onPressNone}) {
    switch (this) {
      case QuestionStatusEnum.failure:
        return onPressedFailure;
      case QuestionStatusEnum.success:
        return onPressedSuccess;
      case QuestionStatusEnum.skip:
        return onPressedSuccess;
      case QuestionStatusEnum.select:
        return onPressedStable;
      case QuestionStatusEnum.none:
        return onPressNone;
    }
  }

  String getButtonTextStatus() {
    switch (this) {
      case QuestionStatusEnum.failure:
        return 'next';
      case QuestionStatusEnum.success:
        return 'next';
      case QuestionStatusEnum.skip:
        return 'next';
      case QuestionStatusEnum.select:
        return 'check';
      case QuestionStatusEnum.none:
        return 'check';
    }
  }
}


extension QuestionStatusBodyExt on FailureEnum {
  Widget getBodyForQuestion({
    Widget? explainWidget,
    Widget? success,
    Widget? stable,
  }) {
    switch (this) {
      case FailureEnum.stable:
        return stable!;
      case FailureEnum.showExpalin:
        return explainWidget!;
      case FailureEnum.trueAnswer:
        return success!;
    }
  }
}

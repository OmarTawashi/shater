import 'package:flutter/widgets.dart';
import 'package:shater/routes/app_routes.dart';

extension LessonExt on String {
  void Function()? getInitFunction(
      {void Function()? teacherFun, void Function()? exerciseFun}) {
    switch (this) {
      case Routes.getPageSubjectScreen:
        return exerciseFun;
      case Routes.getSubcriptionTeacherDetailsScreen:
        return teacherFun;
    }
    return null;
  }

  Widget getLessonWidget(
      {required Widget teacherWidget, required Widget exerciseWidget}) {
    switch (this) {
      case Routes.getPageSubjectScreen:
        return exerciseWidget;
      case Routes.getSubcriptionTeacherDetailsScreen:
        return teacherWidget;
      default:
        return exerciseWidget;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/modules/screens/contact/view/contact_screen.dart';
import 'package:shater/modules/screens/exercises/view/Exercise_screen.dart';
import 'package:shater/modules/screens/firsts/view/first_screen.dart';
import 'package:shater/modules/screens/subject/view/subjects_screen.dart';

import '../../teacher/view/teacher_screen.dart';

enum Semester { semesterOne, semesterTWo }

class DashBoardController extends GetxController {
  int selectedIndex = 0;

  Semester selectSemester = Semester.semesterOne;

  List<Widget> screens = [
    const SubjectsSCreen(),
    const ExerciseScreen(),
    const TeacherScreen(),
    const FirstsScreen(),
    const ContactScreen()
  ];

  void changeIndex(int index) {
    selectedIndex = index;
    update();
  }

  void changeSemester(Semester semester) {
    selectSemester = semester;
    update();
  }
}

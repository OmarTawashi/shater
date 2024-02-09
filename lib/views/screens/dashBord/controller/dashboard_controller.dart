import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/views/screens/contact/view/contact_screen.dart';
import 'package:shater/views/screens/exercises/view/Exercise_screen.dart';
import 'package:shater/views/screens/firsts/view/first_screen.dart';
import 'package:shater/views/screens/subject/view/subjects_screen.dart';

import '../../teacher/view/teacher_screen.dart';

class DashBoardController extends GetxController {
  int selectedIndex = 0;

  List<Widget> screens = [
    SubjectsSCreen(),
    ExerciseScreen(),
    TeacherScreen(),
    FirstsScreen(),
    ContactScreen()
  ];

  void changeIndex(int index) {
    selectedIndex = index;
    update();
  }
}

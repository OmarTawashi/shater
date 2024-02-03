import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/views/screens/exercises/view/Exercise_screen.dart';
import 'package:shater/views/screens/firsts/view/first_screen.dart';
import 'package:shater/views/screens/profile/view/profile_screen.dart';
import 'package:shater/views/screens/results/view/result_screen.dart';
import 'package:shater/views/screens/teachers/view/teachers_screen.dart';

class DashBoardController extends GetxController {
  int selectedIndex = 0;

  List<Widget> screens = [
    TeacherScreen(),
    ExerciseScreen(),
    ResultScreen(),
    FirstsScreen(),
    ProfileScreen()
  ];

  void changeIndex(int index) {
    selectedIndex = index;
    update();
  }
}

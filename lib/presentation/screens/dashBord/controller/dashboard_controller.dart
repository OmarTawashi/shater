import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/controller/shared_prefrences.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/presentation/screens/contact/view/contact_screen.dart';
import 'package:shater/presentation/screens/exercises/view/Exercise_screen.dart';
import 'package:shater/presentation/screens/firsts/view/first_screen.dart';
import 'package:shater/presentation/screens/subject/view/subjects_screen.dart';

import '../../teacher/view/teacher_screen.dart';

enum Semester { semesterOne, semesterTWo }

class DashBoardController extends GetxController {
   
   User? _user = SharedPrefs.user;
   User? get user =>_user;

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

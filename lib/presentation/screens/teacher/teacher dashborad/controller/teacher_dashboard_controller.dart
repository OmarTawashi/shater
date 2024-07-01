import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/controller/shared_prefrences.dart';
import 'package:shater/data/model/public_model.dart';
import 'package:shater/data/model/user.dart';
import '../../Explanation/view/teacher_explanation_screen.dart';
import '../../My Explanation/teacher_my_lessons_screen.dart';
import '../../practice/practice_screen.dart';
import '../../subscription/subscribers_screen.dart';

class TeacherDashBoardController extends GetxController {
  User? _user = SharedPrefs.user;
  User? get user => _user;

  int selectedIndex = 0;

  PublicModel? _level = PublicModel(id: 1, title: 'الفصل الأول'); //review
  PublicModel? get level => _level;

  List<Widget> screens = [
    const TeacherMyLessonsScreen(),
    const PracticeScreen(),
    const TeacherExplanationScreen(),
    const SubscribersScreen(),
    const TeacherMyLessonsScreen(),
    // const PracticeScreen(),
    // const TeacherScreen(),
    // const FirstsScreen(),
    // const NotificationContactScreen()
  ];

  void changeIndex(int index) {
    selectedIndex = index;
    update();
  }

  void changeLevel(PublicModel? levelc) {
    _level = levelc;
    update();
  }
}

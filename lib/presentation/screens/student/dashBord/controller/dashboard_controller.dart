import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/controller/shared_prefrences.dart';
import 'package:shater/data/model/public_model.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/presentation/screens/student/exercises/view/Exercise_screen.dart';
import 'package:shater/presentation/screens/student/firsts/view/first_screen.dart';
import 'package:shater/presentation/screens/student/notification%20&%20contact/view/notification_contact_screen.dart';
import 'package:shater/presentation/screens/student/subject/view/subjects_screen.dart';

import '../../teacher/view/teacher_screen.dart';

class DashBoardController extends GetxController {
  User? _user = SharedPrefs.user;
  User? get user => _user;

  int selectedIndex = 0;

  PublicModel? _level = PublicModel(id: 1, title: 'الفصل الأول'); //review
  PublicModel? get level => _level;

  List<Widget> screens = [
    const SubjectsSCreen(),
    const ExerciseScreen(),
    const TeacherScreen(),
    const FirstsScreen(),
    const NotificationContactScreen()
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


import 'package:flutter/material.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/presentation/screens/profile/view/student_profile_screen.dart';
import 'package:shater/presentation/screens/profile/view/teacher_profile_screen.dart';

import '../../../../core/controller/shared_prefrences.dart';

class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? parentUser = SharedPrefs.user;
    if(parentUser?.isTeacher != 1){
      return StudentProfileScreen();
    }else{
      return TeacherProfileScreen();

    }
  }
}



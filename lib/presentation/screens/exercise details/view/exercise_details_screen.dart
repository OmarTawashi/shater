import 'package:flutter/material.dart';
import 'package:shater/util/color.dart';

import '../../base/semester_type_widget.dart';
import '../../exercise subject/view/exercise_subject_screen.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  const ExerciseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      appBar: AppBar(
        leadingWidth: 120,
        backgroundColor: COLORS.primaryColor,
        leading: IconTextCont(
          text: 'رياضيات',
        ),
        actions: [
          SemesterTypeWidget(
            semester: 'season_one',
          )
        ],
      ),
    );
  }
}

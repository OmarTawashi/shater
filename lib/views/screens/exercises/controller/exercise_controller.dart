import 'package:get/get.dart';

enum TabExercise { exercied, exerciedTeachers }

class ExerciseController extends GetxController {
  TabExercise selectExercise= TabExercise.exercied;

  void changeSection(TabExercise tabSection) {
    selectExercise = tabSection;
    update();
  }
}

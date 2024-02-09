import 'package:get/get.dart';

class TeacherController extends GetxController {
  int selectedTapIndex = 0;

  void changeTapIndex(int index) {
    selectedTapIndex = index;
    update();
  }
}

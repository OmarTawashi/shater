import 'package:get/get.dart';

enum TabFirsts { studentToday, schoolToday }

class FirstsController extends GetxController {
  TabFirsts selectSection = TabFirsts.studentToday;

  void changeSection(TabFirsts tabSection) {
    selectSection = tabSection;
    update();
  }
}

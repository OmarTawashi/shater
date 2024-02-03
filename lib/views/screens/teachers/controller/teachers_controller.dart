import 'package:get/get.dart';

enum TabSection { sectionOne, sectionTwo }

class TeacherController extends GetxController {
  TabSection selectSection = TabSection.sectionOne;

  void changeSection(TabSection tabSection) {
    selectSection = tabSection;
    update();
  }
}

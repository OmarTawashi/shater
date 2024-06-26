import 'package:shater/core/controller/base_controller.dart';

enum TabContact { contacts, exerciedTeachers }

class ExerciseContactController extends BaseController {
  TabContact selectContact = TabContact.contacts;

  void changeSection(TabContact tabSection) {
    selectContact = tabSection;
    update();
  }
}

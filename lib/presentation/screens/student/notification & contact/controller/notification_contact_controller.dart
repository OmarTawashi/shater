import 'package:shater/core/controller/base_controller.dart';

enum TabContact { contacts, notifications }

class NotificationContactController extends BaseController{
 TabContact selectContact= TabContact.contacts;

  void changeSection(TabContact tabSection) {
    selectContact = tabSection;
    update();
  }

}


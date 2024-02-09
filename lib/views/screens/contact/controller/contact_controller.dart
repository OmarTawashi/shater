import 'package:get/get.dart';
enum TabContact { contacts, notifications }

class ContactController extends GetxController{
 TabContact selectContact= TabContact.contacts;

  void changeSection(TabContact tabSection) {
    selectContact = tabSection;
    update();
  }
}


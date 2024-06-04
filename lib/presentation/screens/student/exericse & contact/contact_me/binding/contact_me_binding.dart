import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/contact_me/controller/contact_me_controller.dart';

class ContactMeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactMeController());
  }
}

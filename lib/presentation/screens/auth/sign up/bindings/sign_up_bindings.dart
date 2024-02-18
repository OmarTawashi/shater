import 'package:get/get.dart';
import 'package:shater/modules/screens/auth/sign%20up/controller/sign_up_controller.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() =>SignUpController());
  }

}
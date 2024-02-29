import 'package:get/get.dart';
import 'package:shater/presentation/screens/auth/forget%20password/controller/forget_password_controller.dart';

class ForgetPasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
  }

}
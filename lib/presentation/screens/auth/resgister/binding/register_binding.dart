import 'package:get/get.dart';
import 'package:shater/presentation/screens/auth/resgister/controller/register_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }

}
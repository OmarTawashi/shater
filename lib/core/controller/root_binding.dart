import 'package:get/get.dart';
import 'package:shater/core/controller/localization_controller.dart';
import 'package:shater/presentation/screens/auth/base%20login/controller/auth_controller.dart';
import 'package:shater/presentation/screens/teacher/Explanation/view/add_excercise/add_quastion_controller.dart';
import 'package:shater/presentation/screens/teacher/Explanation/view/add_excercise/custom_add_quastion_screen.dart';
import 'package:shater/presentation/screens/auth/sign%20in/controller/sign_in_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() async {
    // Get.put(SplashController());
    Get.put(AuthController());
    Get.put(SignInController());
    Get.lazyPut(() => LocalizationController());
    Get.lazyPut(() => AddQuastionController(),fenix: true);

  }
}

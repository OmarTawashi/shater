import 'package:get/get.dart';
import 'package:shater/core/controller/localization_controller.dart';
import 'package:shater/presentation/screens/auth/base%20login/controller/auth_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() async {
    // Get.put(SplashController());
    Get.put(AuthController());
    Get.lazyPut(() => LocalizationController());
  }
}

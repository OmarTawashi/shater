import 'package:get/get.dart';
import 'package:shater/core/controller/localization_controller.dart';


class RootBinding extends Bindings {
  @override
  void dependencies() async {
    // Get.put(SplashController());
    Get.lazyPut(() => LocalizationController());
  }
}

import 'package:get/get.dart';
import 'package:shater/core/controller/localization_controller.dart';
import 'package:shater/presentation/screens/auth/base%20login/controller/auth_controller.dart';
import 'package:shater/presentation/screens/teacher/Explanation/record_title_audio/record_title_audio_controller_.dart';
import 'package:shater/presentation/screens/teacher/Explanation/view/add_excercise/add_quastion_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() async {
    // Get.put(SplashController());
    Get.put(AuthController());
    Get.lazyPut(() => LocalizationController());
    Get.lazyPut(() => AddQuastionController(),fenix: true);
    // Get.lazyPut(() => AudioController(),fenix: true);
    Get.lazyPut(() => RecordController(),fenix: true);
  }
}

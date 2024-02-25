import 'package:get/get.dart';
import 'package:shater/presentation/screens/level/controller/level_controller.dart';

class LevelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeveController());
  }
}
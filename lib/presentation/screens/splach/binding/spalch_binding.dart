import 'package:get/get.dart';

import '../controller/splach_controller.dart';

class SpalchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplachController>(SplachController());
  }
}

import 'package:get/get.dart';

import '../controller/qualifications_controller.dart';

class QualificationsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => QualificationsController());
  }

}
import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/questions/congrlate/controller/congrlate_controller.dart';

class CongralteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CongrlateController());
  }
}

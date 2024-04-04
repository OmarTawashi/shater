import 'package:get/get.dart';
import 'package:shater/presentation/screens/classe/controller/classe_controller.dart';

class ClasseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClasseController());
  }
}
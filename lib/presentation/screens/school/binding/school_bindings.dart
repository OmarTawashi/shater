import 'package:get/get.dart';
import 'package:shater/presentation/screens/school/controller/school_controller.dart';

class SchoolBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SchoolController());
  }

}
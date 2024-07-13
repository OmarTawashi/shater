import 'package:get/get.dart';
import 'package:shater/presentation/screens/school/controller/school_controller.dart';

class SchoolBinding extends Bindings{

  final int typeFrom;

  SchoolBinding(this.typeFrom);

  @override
  void dependencies() {
    Get.lazyPut(() => SchoolController(typeFrom));
  }

}
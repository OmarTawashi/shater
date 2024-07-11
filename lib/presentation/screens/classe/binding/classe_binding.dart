import 'package:get/get.dart';
import 'package:shater/presentation/screens/classe/controller/classe_controller.dart';

class ClasseBinding extends Bindings {

  final int typeFrom;

  ClasseBinding(this.typeFrom);

  @override
  void dependencies() {
    Get.lazyPut(() => ClasseController(typeFrom));
  }
}
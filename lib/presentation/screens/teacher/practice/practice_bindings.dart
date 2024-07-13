import 'package:get/get.dart';
import 'package:shater/presentation/screens/teacher/practice/practice_controller.dart';


class PracticeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PracticeController());
  }

}
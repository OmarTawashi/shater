import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/subject%20teacher/controller/subject_techer_controller.dart';

import 'subscribers_controller.dart';

class SubscribersBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SubscribersController());
  }

}
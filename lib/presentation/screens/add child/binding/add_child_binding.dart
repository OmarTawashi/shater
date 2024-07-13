import 'package:get/get.dart';

import '../controller/add_child_controller.dart';

class AddChildBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddChildController());
  }

}
import 'package:get/get.dart';

import 'subscribers_controller.dart';

class SubscribersBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SubscribersController());
  }

}
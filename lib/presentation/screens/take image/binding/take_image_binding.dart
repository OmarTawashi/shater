import 'package:get/get.dart';
import 'package:shater/presentation/screens/take%20image/controller/take_image_controller.dart';

class TakeImageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TakeImageController());
  }

}
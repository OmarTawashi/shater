import 'package:get/get.dart';
import 'package:shater/presentation/screens/auth/resgister/controller/register_controller.dart';
import 'package:shater/presentation/screens/edit%20profile/take%20image/controller/take_image_controller.dart';

class TakeImageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TakeImageController());
        Get.put(RegisterController());

  }

}
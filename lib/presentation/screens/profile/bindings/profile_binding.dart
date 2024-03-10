import 'package:get/get.dart';
import 'package:shater/presentation/screens/profile/controller/profile_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }

}
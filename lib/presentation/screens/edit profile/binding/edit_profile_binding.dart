import 'package:get/get.dart';
import 'package:shater/presentation/screens/edit%20profile/controller/edit_profile_controller.dart';

class EditProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileController());
  }

}
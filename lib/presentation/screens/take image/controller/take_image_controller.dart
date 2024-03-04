import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/core/base/image_converter.dart';
import 'package:shater/presentation/screens/auth/sign%20up/controller/sign_up_controller.dart';

class TakeImageController extends GetxController {
  ImagePicker picker = ImagePicker();

 

  File? _imageFile;
  File? get imageFile => _imageFile;

  XFile? _xfileImage;

  final signUpController = Get.find<SignUpController>();

  String? _typeAvatar;
  String? get typeAvatar => _typeAvatar;

  String? _imageAvatarSelect;
  String? get imageAvatarSelect => _imageAvatarSelect;

 

  void setTypeAvatar(String type) {
    _typeAvatar = type;
    update();
  }

  void setImageFile(File? file) {
    _imageFile = file;
    update();
  }

  Future<void> takeCameraImage() async {
    _xfileImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 30);
    if (_xfileImage != null) {
      _imageFile = File(_xfileImage!.path);
      signUpController.setImageFileUSer(_imageFile!);
    }
    update();
  }

  Future<void> takeGalleryImage() async {
    _xfileImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);
    if (_xfileImage != null) {
      _imageFile = File(_xfileImage!.path);
      signUpController.setImageFileUSer(_imageFile!);
    }
    update();
  }

  void getImageAvatarToFile(String imageAvatar) async {
    _imageAvatarSelect = imageAvatar;
    update();
    _imageFile =
        await ImageConverter.getImageFileFromAssets(_imageAvatarSelect ?? '');
    if (_imageFile != null) {
      signUpController.setImageFileUSer(_imageFile);
    } else {
      BaseMixin.showToastFlutter(messsage: 'error in store Image File');
    }
  }
}

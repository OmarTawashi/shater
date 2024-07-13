import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/util/color.dart';
import 'package:video_player/video_player.dart';

class AddQuastionController extends BaseController {
  PageController pageController = PageController();
  int currentIndex = 0;
  TextEditingController descTextController = TextEditingController();
  bool isPlaying = false;
  XFile? thecropedImage;
  CroppedFile? cropedFileimage;
  final ImagePicker picker = ImagePicker();
  File? imageFile;
  File? videoFile;
  VideoPlayerController? videoPlayerController;
  // Future<void> pickImage(ImageSource source) async {
  //   final pickedFile = await picker.pickImage(source: source);
  //   if (pickedFile != null) {
  //     imageFile = File(pickedFile.path);
  //     update();
  //   }
  // }

  Future<void> pickVideo(ImageSource source) async {
    final pickedFile = await picker.pickVideo(
      source: source,
      preferredCameraDevice: CameraDevice.rear,
      maxDuration: Duration(minutes: 15),
    );
    XFile? xfilePick = pickedFile;

    if (xfilePick != null) {
      videoFile = File(pickedFile!.path);
      videoPlayerController = VideoPlayerController.file(videoFile!)
        ..initialize().then(
          (_) {
            videoPlayerController!.play();
            update();
          },
        );
      update();
    }
  }

  void showPicker(BuildContext context, bool isImage) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('معرض الصور'),
                onTap: () {
                  Navigator.of(context).pop();
                  if (isImage) {
                    pickImage(true);
                  } else {
                    pickVideo(ImageSource.gallery);
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('الكاميرا'),
                onTap: () {
                  Navigator.of(context).pop();
                  if (isImage) {
                    pickImage(false);
                  } else {
                    pickVideo(ImageSource.camera);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void playVideo() {
    if (isPlaying) {
      videoPlayerController!.pause();
      update();
    } else {
      videoPlayerController!.play();
      update();
    }
    isPlaying = !isPlaying;
  }

  void changeCurrentIndex(var value) {
    currentIndex = value;
    update();
  }

  void pickImage(bool pickGalleryImage) async {
    final picker = ImagePicker();

    if (pickGalleryImage == true) {
      thecropedImage = await picker.pickImage(source: ImageSource.gallery);
    } else {
      thecropedImage = await picker.pickImage(source: ImageSource.camera);
    }
    if (thecropedImage != null) {
      cropedFileimage = await cropImages(thecropedImage!);
      update();
      // Get.back();
      // if (!mounted) return;

      // Get.to(
      //   () => CroppedImage(
      //     image: croppedImage,
      //   ),
      // );
    }
  }

  Future<CroppedFile> cropImages(XFile image) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 200, ratioY: 200),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: COLORS.backGroundColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Crop Image',
        ),
      ],
    );

    return croppedFile!;
  }

deleteImage(){
  cropedFileimage=null;
  update();
}
}

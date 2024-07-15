import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/response_model.dart';
import 'package:shater/data/repository/teacher_repository_remote.dart';
import 'package:shater/domain/usecase/teacher_usecase_imp.dart';
import 'package:shater/util/color.dart';
import 'package:video_player/video_player.dart';

class AddQuastionController extends BaseController {
  TeacherUseCaseImp? _teacherUseCaseImp;
  final TextEditingController titletextController = TextEditingController();
  final TextEditingController extraTitletextController =
      TextEditingController();
  final TextEditingController hinttextController = TextEditingController();
  bool title_has_audio = false;
  @override
  void onInit() {
    _teacherUseCaseImp = TeacherUseCaseImp(
      TeacherRepositoryRemote(
        ApiClient(),
      ),
    );
    super.onInit();
  }

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
  ResponseModel createquastionRes = ResponseModel();

  bool selectedAnswer = true;
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

  deleteImage() {
    cropedFileimage = null;
    update();
  }

  createNewquastion({
    required int page_id,
  }) async {
    updateViewType(ViewType.loading);
    await _teacherUseCaseImp?.createNewquastion(
      body: {
        "question_media": "Test",
        "page_id": page_id,
        "answer": selectedAnswer,
        "title": titletextController.text,
        "hint": hinttextController.text,
        "title_extra": titletextController.text,
        "type_id": 17,
        "title_has_audio": title_has_audio ? 1 : 0,
        // "option_style": "<null>",
        "media": "text",
      },
    ).then(
      (value) {
        value?.fold(
          (l) {
            updateViewType(ViewType.error);
          },
          (s) async {
            if (s.status != true) {
              updateViewType(ViewType.error);
            } else {
              createquastionRes = await s;
              updateViewType(ViewType.success);
              update();
            }
          },
        );
        update();
      },
    );
  }
}

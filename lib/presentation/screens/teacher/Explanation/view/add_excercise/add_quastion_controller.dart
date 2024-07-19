import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/response_model.dart';
import 'package:shater/data/repository/teacher_repository_remote.dart';
import 'package:shater/domain/usecase/teacher_usecase_imp.dart';
import 'package:shater/util/color.dart';
import 'package:video_player/video_player.dart';

enum MediaType { image, text, video, audio }

class AddQuastionController extends BaseController {
  @override
  void onInit() {
    _teacherUseCaseImp = TeacherUseCaseImp(TeacherRepositoryRemote(
      ApiClient(),
    ));
    titletextController = TextEditingController();
    extraTitletextController = TextEditingController();
    hinttextController = TextEditingController();
    descTextController = TextEditingController();
    pageController = PageController();
    super.onInit();
  }

  TeacherUseCaseImp? _teacherUseCaseImp;
  late TextEditingController titletextController;
  late TextEditingController extraTitletextController;
  late TextEditingController hinttextController;
  bool title_has_audio = false;
  PlatformFile? titleAudioFile;
  late PageController pageController;
  int currentIndex = 0;
  late TextEditingController descTextController;
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
    if (imageFile != null ||
        titleAudioFile != null ||
        descTextController.text.isNotEmpty) {
      Get.snackbar('خطأ', 'يمكنك إضافة نوع واحد فقط');
      return;
    }
    final pickedFile = await picker.pickVideo(
      source: source,
      preferredCameraDevice: CameraDevice.rear,
      maxDuration: Duration(minutes: 15),
    );
    XFile? xfilePick = pickedFile;

    if (xfilePick != null) {
      videoFile = File(pickedFile!.path);
      getQuestionMediaFile(MediaType.video);
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
    if (videoFile != null ||
        titleAudioFile != null ||
        descTextController.text.isNotEmpty) {
      Get.snackbar('خطأ', 'يمكنك إضافة نوع واحد فقط');
      return;
    }
    final picker = ImagePicker();
    if (pickGalleryImage == true) {
      thecropedImage = await picker.pickImage(source: ImageSource.gallery);
    } else {
      thecropedImage = await picker.pickImage(source: ImageSource.camera);
    }
    if (thecropedImage != null) {
      cropedFileimage = await cropImages(thecropedImage!);
      getQuestionMediaFile(MediaType.image);
      update();
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

  transferTextTofile(String text) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/textfile.txt');
    final bytes = utf8.encode(text);
    await file.writeAsBytes(bytes);
    return file;
  }

  updateTitleHasAudio({bool? hasAudiaudioFile, PlatformFile? audioFile}) {
    title_has_audio = hasAudiaudioFile!;
    titleAudioFile = audioFile;
    update();
  }

  Future<dynamic> getQuestionMediaFile(MediaType mediaType) async {
    switch (mediaType.name) {
      case "text": // Text case
        if (descTextController.text.isNotEmpty) {
          return await transferTextTofile(descTextController.text);
        }
        break;
      case "image": // Image case
        if (imageFile != null) {
          return imageFile;
        }
        break;
      case "video": // Video case
        if (videoFile != null) {
          return videoFile;
        }
        break;
      case "audio": // Audio case
        if (titleAudioFile != null) {
          return titleAudioFile;
        }
        break;
      default:
        return null;
    }
    return null;
  }

  void createNewquastion({
    required int page_id,
    // required var mediaFileType,
  }) async {
    updateViewType(ViewType.loading);
    File? questionMediaFile = await getQuestionMediaFile(MediaType.text);

    if (questionMediaFile == null) {
      updateViewType(ViewType.error);
      return;
    }
    await _teacherUseCaseImp?.createNewquastion(
      body: {
        "question_media": 'text',
        "page_id": page_id,
        "answer": selectedAnswer,
        "title": titletextController.text,
        "hint": hinttextController.text,
        "title_extra": titletextController.text,
        "type_id": 17,
        "title_has_audio": title_has_audio ? 1 : 0,
        "media": "text", // تحديد نوع المرفق
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

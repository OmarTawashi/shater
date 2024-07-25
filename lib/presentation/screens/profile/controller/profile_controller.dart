import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/data/repository/profile_repository_remote.dart';
import 'package:shater/domain/usecase/profile_usecase_imp.dart';
import 'package:shater/presentation/screens/edit%20profile/binding/edit_profile_binding.dart';
import 'package:shater/presentation/screens/edit%20profile/controller/edit_profile_controller.dart';

import '../../../../core/base/base_mixin.dart';
import '../../../../core/controller/shared_prefrences.dart';
import '../../../../core/network/api_exceptions.dart';
import '../../../../core/network/api_response.dart';
import '../../../../data/model/qualification_response.dart';
import '../../../../util/api_constant.dart';
import '../../auth/sign in/controller/sign_in_controller.dart';

class ProfileController extends BaseController {
  ProfileUseCaseImp? _profileUseCaseImp;

  User? profileData;

  List<QualificationResponse> qualifications = [];

  // User? get profileData => profileData;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  File? introVideo;
  String? introVideoName;
  TextEditingController aboutEditingController = TextEditingController();
  bool isVideoLoading = false;

  @override
  void onInit() {
    super.onInit();
    _profileUseCaseImp =
        ProfileUseCaseImp(ProfileRepositoryRemote(ApiClient()));
    // getProfile();
  }

  initAboutScreen(){
    aboutEditingController.text = profileData?.about ?? '';
    introVideo = null;
    introVideoName = null;
    _isLoading = false;
    isVideoLoading = false;
  }

  disposeAboutScreen(){
    aboutEditingController.clear();
    introVideo = null;
    introVideoName = null;
    _isLoading = false;
    isVideoLoading = false;
  }

  void setLoad(bool isLoad) {
    _isLoading = isLoad;
    update();
  }

  bool isSelectedChild(int userId) {
    ChildUser? selectedChild = SharedPrefs.selectedChild;
    if (userId == selectedChild?.id) {
      return true;
    } else {
      return false;
    }
  }

  void changeSelectedChild(ChildUser childUser) {
    SignInController signInController = Get.find<SignInController>();
    signInController.selectedChild = childUser;
    SharedPrefs.saveSelectedChild(childUser);
    profileData = null;
    getStudentProfile();
    update();
  }

  void getStudentProfile() async {
    // type 0 = parent || type 1 = child
    int type = getType();
    log("getProfile type : $type");
    setLoad(true);
    await _profileUseCaseImp
        ?.fetchProfile(SharedPrefs.getToken(type))
        .then((value) {
      value?.fold((l) {
        handelError(l);
      }, (r) {
        log("getProfile : ${r.toJson()}");
        profileData = r;
      });
      setLoad(false);

      update();
    });
  }


  void getTeacherProfile() async {
    setLoad(true);
    await _profileUseCaseImp
        ?.fetchProfile(SharedPrefs.getToken(0),isTeacher: true)
        .then((value) async {
      value?.fold((l) {
        handelError(l);
      }, (r) {
        log("getProfile : ${r.toJson()}");
        profileData = r;
      });

      await getTeacherQualifications();
      setLoad(false);

      update();
    });
  }


  Future<void> getTeacherQualifications() async {
    try{
      qualifications.clear();
      await _profileUseCaseImp
          ?.getTeacherQualifications(id: SharedPrefs.user?.id ?? 0)
          .then((value) async {
        value?.fold((l) {
          handelError(l);
        }, (r) {
          for(QualificationResponse qul in r){
            if(qul.file != null){
              qualifications.add(qul);
            }
          }
        });
      });
    }catch (e){
      log("getTeacherQualifications e : $e");
      return ;
    }
  }

  selectFileFromDevice() async {
    isVideoLoading = true;
    update();
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.video );
    File file;
    if (result != null) {
      file = File(result.files.single.path!);
      introVideo = file;
      introVideoName = result.files.single.name;
      isVideoLoading = false;
      update();
    }else{
      isVideoLoading = false;
      update();
    }

  }

  editTeacherProfile() async {
    _isLoading = true;
    update();
    final completer = Completer<Either<ApiException, User>?>();
    final data = {
      'about' : aboutEditingController.text.trim(),
    };
    dio.FormData formData = await dio.FormData.fromMap(data);
    if (introVideo != null) {
      formData.files.add(MapEntry(
        'intro_video',
        await dio.MultipartFile.fromFile(introVideo!.path ?? ''),
      ));
    }
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.updateTeacherProfile,
        requestType: RequestType.post,
        create: () => APIResponse<User>(
          create: () => User(),
        ),
        data: formData,
        headers: {
          'Content-Type': 'multipart/form-data; boundary=${formData.boundary}',
        },
        onSuccess: (response) {
          if (response.data?.status == false ?? false) {
            completer.complete(left(ApiException(
              message: response.data?.errors?.first.message ?? "",
              response: response.response,
            )));
          } else {
            final user = response.data?.item;
            completer.complete(Right(user ?? User()));
            if (user != null) {
              Get.find<ProfileController>().profileData = user;
              BaseMixin.showToastFlutter(messsage: 'updated successfully'.tr);
              Get.back();
              _isLoading = false;
              update();
            }
          }
        },
        onError: (error) {
          completer.complete(left(error));
          _isLoading = false;
          update();
        },
      );
    } on ApiException catch (error) {
      completer.complete(left(error));
      _isLoading = false;
      update();
    }
  }

  bool isAboutEnable(){
    bool isEnable = aboutEditingController.text.isNotEmpty && aboutEditingController.text != (profileData?.about ?? '');
    return isEnable;
  }

  int getType() {
    if (SharedPrefs.selectedChild?.apiToken == null ||
        (SharedPrefs.selectedChild?.apiToken ?? '').isEmpty ||
        SharedPrefs.selectedChild?.apiToken == "") {
      return 0;
    }else{
      return 1;
    }
  }
}

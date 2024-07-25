import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/core/controller/shared_prefrences.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/data/repository/auth_repository_remote.dart';
import 'package:shater/domain/usecase/auth_usecase_imp.dart';
import 'package:shater/presentation/screens/profile/controller/profile_controller.dart';
import 'package:shater/routes/app_routes.dart';

import 'package:collection/collection.dart';
import '../../../../core/network/api_exceptions.dart';
import '../../../../core/network/api_response.dart';
import '../../../../data/model/class_model.dart';
import '../../../../data/model/public_model.dart';
import '../../../../data/model/school_model.dart';
import '../../../../data/model/subject_model.dart';
import '../../../../util/api_constant.dart';

class EditProfileController extends GetxController {
  User? _user;

  User? get user => _user;

  AuthUseCaseImp? _authUseCaseImp;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _isLogoutLoading = false;

  bool get isLogoutLoading => _isLogoutLoading;

  File? _imageFile;

  File? get imageFile => _imageFile;

  School? _schoolSelected;

  School? get schoolSelected => _schoolSelected;

  File? _imageFileUser;

  File? get imageFileUser => _imageFileUser;

  PublicModel? _citySelected;

  PublicModel? get citySelected => _citySelected;

  Subject? _subjectSelected;

  Subject? get subjectSelected => _subjectSelected;

  List<Classes> _classSelected = [];

  List<Classes> get classSelected => _classSelected;

  Classes? _classStudSelected;

  Classes? get classStudSelected => _classStudSelected;

  String? classesText;

  TextEditingController nameController = TextEditingController();
  TextEditingController deleteAccountTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _authUseCaseImp = AuthUseCaseImp(AuthRepositoryRemote(ApiClient()));

    _user = Get.find<ProfileController>().profileData;
    initData(user!);
  }

  void initStudentData(User user) {
    nameController.text = user.name?.trim() ?? '';
    _citySelected = user.city;
    _schoolSelected = user.school;
    if (user.isTeacher == 1) {
      classSelected.clear();
      for (Classes cls in user.teacherClass ?? []) {
        classSelected.add(cls);
      }
    } else {
      _classStudSelected = user.classes;
    }
    // _classSelected = user.c;
  }

  void initTeacherData(User user) {
    nameController.text = user.name?.trim() ?? '';
    _citySelected = user.city;
    _schoolSelected = user.school;
    _subjectSelected = user.subject;
    if (user.isTeacher == 1) {
      classSelected.clear();
      for (Classes cls in user.teacherClass ?? []) {
        classSelected.add(cls);
      }
      setClassesText();
    } else {
      _classStudSelected = user.classes;
    }
    // _classSelected = user.c;
  }

  void initData(User user) {
    if (user.isTeacher == 1) {
      initTeacherData(user);
    } else {
      initStudentData(user);
    }
  }

  bool isStudentEnable() {
    bool isNameChanged =
        nameController.text.isNotEmpty && isNameChange(nameController.text);
    bool isCityChanged =
        citySelected != null && citySelected?.id != user?.city?.id;
    bool isSchoolChanged =
        schoolSelected != null && schoolSelected?.id != user?.school?.id;
    bool isClassChanged =
        classStudSelected != null && classStudSelected?.id != user?.classes?.id;

    bool isAllEnable = isClassChanged ||
        isSchoolChanged ||
        isCityChanged ||
        isNameChanged ||
        imageFile != null;

    update();

    return isAllEnable;
  }

  bool isTeacherEnable() {
    bool isNameChanged =
        nameController.text.isNotEmpty && isNameChange(nameController.text);
    bool isCityChanged =
        citySelected != null && citySelected?.id != user?.city?.id;
    bool isSchoolChanged =
        schoolSelected != null && schoolSelected?.id != user?.school?.id;
    bool isSubjectChanged =
        subjectSelected != null && subjectSelected?.id != user?.subject?.id;
    Function deepEq = const DeepCollectionEquality().equals;

    bool isClassesChanged = !deepEq(classSelected, user?.teacherClass);

    bool isAllEnable = isSubjectChanged ||
        isSchoolChanged ||
        isCityChanged ||
        isNameChanged ||
        isClassesChanged ||
        imageFile != null;

    log("isAllEnable : $isAllEnable");
    log("isSubjectChanged : $isSubjectChanged");
    log("isSchoolChanged : $isSchoolChanged");
    log("isCityChanged : $isCityChanged");
    log("isNameChanged : $isNameChanged");
    log("isClassesChanged : $isClassesChanged");
    log("imageFile != null : ${imageFile != null}");

    update();

    return isAllEnable;
  }

  bool isNameChange(String value) {
    bool isChanged = user?.name != value;
    return isChanged;
  }

  void setLoad(bool isLoad) {
    _isLogoutLoading = isLoad;
    update();
  }

  void setCity(PublicModel city) {
    _citySelected = city;

    update();
  }

  void setSubject(Subject subject) {
    _subjectSelected = subject;

    update();
  }

  void setImageFileUSer(File? image) {
    _imageFileUser = image;
    update();
  }

  void setClassStud(Classes classe) {
    _classStudSelected = classe;
    update();
  }

  void setClasses(Classes classe) {
    if (_classSelected.contains(classe)) {
      _classSelected.remove(classe);
    } else {
      _classSelected.add(classe);
    }
    setClassesText();
    update();
  }

  void setClassesText() {
    String text = "";
    for (Classes cls in classSelected.toSet().toList()) {
      if (cls == classSelected[0]) {
        text = text + (cls.title?.replaceRange(0, 5, '') ?? '');
      } else {
        text = text + " - " + (cls.title?.replaceRange(0, 5, '') ?? '');
      }
    }
    classesText = text;
    update();
  }

  void setSchool(School city) {
    _schoolSelected = city;
    update();
  }

  void setImageFile(File? file) {
    _imageFile = file;
    update();
  }

  void signOut() async {
    setLoad(true);
    await _authUseCaseImp?.signOut().then((value) {
      value?.fold((l) {
        BaseMixin.showToastFlutter(messsage: l.message);
      }, (r) async {
        BaseMixin.showToastFlutter(messsage: r.message);
        Get.offAllNamed(Routes.getSignInScreen());
        await SharedPrefs.logout();
      });
      setLoad(true);

      update();
    });
  }

  void deleteAccount() async {
    _isLoading = true;
    update();
    await _authUseCaseImp?.deleteAccount().then((value) {
      value?.fold((l) {
        BaseMixin.showToastFlutter(messsage: l.message);
      }, (r) async {
        BaseMixin.showToastFlutter(messsage: r.message);
        Get.offAllNamed(Routes.getSignInScreen());
        await SharedPrefs.logout();
      });
      _isLoading = false;
      update();

      update();
    });
  }

  editProfile() async {
    _isLoading = true;
    update();
    final completer = Completer<Either<ApiException, User>?>();
    final data = getProfileUpdatedMap();
    dio.FormData formData = await dio.FormData.fromMap(data);
    if (imageFile != null) {
      formData.files.add(MapEntry(
        'image',
        await dio.MultipartFile.fromFile(imageFile!.path ?? ''),
      ));
    }
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.updateStudentProfile,
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

              update();
              BaseMixin.showToastFlutter(messsage: 'updated successfully'.tr);
              Get.back();
              _isLoading = false;
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

  editTeacherProfile() async {
    _isLoading = true;
    update();
    final completer = Completer<Either<ApiException, User>?>();
    final data = getTeacherProfileUpdatedMap();
    dio.FormData formData = await dio.FormData.fromMap(data);
    if (imageFile != null) {
      formData.files.add(MapEntry(
        'image',
        await dio.MultipartFile.fromFile(imageFile!.path ?? ''),
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

  Map<String, dynamic> getProfileUpdatedMap() {
    bool isNameChanged =
        nameController.text.isNotEmpty && isNameChange(nameController.text);
    bool isCityChanged =
        citySelected != null && citySelected?.id != user?.city?.id;
    bool isSchoolChanged =
        schoolSelected != null && schoolSelected?.id != user?.school?.id;
    bool isClassChanged =
        classStudSelected != null && classStudSelected?.id != user?.classes?.id;

    Map<String, dynamic> formData = {};

    formData.addIf(isCityChanged, 'city_id', citySelected!.id);
    formData.addIf(isSchoolChanged, 'school_id', schoolSelected!.id);
    formData.addIf(isClassChanged, 'class_id', classStudSelected!.id);
    formData.addIf(isNameChanged, 'name', nameController.text);

    log("formData Map : ${formData.toString()}");
    return formData;
  }

  Map<String, dynamic> getTeacherProfileUpdatedMap() {
    bool isNameChanged =
        nameController.text.isNotEmpty && isNameChange(nameController.text);
    bool isCityChanged =
        citySelected != null && citySelected?.id != user?.city?.id;
    bool isSchoolChanged =
        schoolSelected != null && schoolSelected?.id != user?.school?.id;
    bool isSubjectChanged =
        subjectSelected != null && subjectSelected?.id != user?.subject?.id;
    Function deepEq = const DeepCollectionEquality().equals;

    bool isClassesChanged = !deepEq(classSelected, user?.teacherClass);

    Map<String, dynamic> formData = {};

    formData.addIf(isCityChanged, 'city_id', citySelected!.id);
    formData.addIf(isSchoolChanged, 'school_id', schoolSelected!.id);
    formData.addIf(isSubjectChanged, 'subject_name', subjectSelected!.title);
    formData.addIf(isNameChanged, 'name', nameController.text);

    if (isClassesChanged) {
      List<String> classesId = [];
      for (Classes cls in classSelected.toSet().toList()) {
        classesId.add(cls.id ?? '');
      }

      formData.addIf(isClassesChanged, 'classes', classesId);
    }

    log("formData Map : ${formData.toString()}");
    return formData;
  }
}

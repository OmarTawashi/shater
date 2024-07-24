import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/core/controller/shared_prefrences.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/data/repository/auth_repository_remote.dart';
import 'package:shater/domain/usecase/auth_usecase_imp.dart';
import 'package:shater/presentation/screens/profile/controller/profile_controller.dart';

import '../../../../data/model/class_model.dart';
import '../../../../data/model/public_model.dart';
import '../../../../data/model/school_model.dart';

class AddChildController extends GetxController {

  File? _imageFile;

  File? get imageFile => _imageFile;

  School? _schoolSelected;

  School? get schoolSelected => _schoolSelected;

  File? _imageFileUser;

  File? get imageFileUser => _imageFileUser;

  PublicModel? _citySelected;

  PublicModel? get citySelected => _citySelected;

  List<Classes> _classSelected = [];

  List<Classes> get classSelected => _classSelected;

  Classes? _classStudSelected;

  Classes? get classStudSelected => _classStudSelected;

  TextEditingController fullNameController = TextEditingController();

  bool isLoading = false;

  AuthUseCaseImp? _authUseCaseImp;

  @override
  void onInit() {
    super.onInit();
    _authUseCaseImp = AuthUseCaseImp(AuthRepositoryRemote(ApiClient()));
  }

  void setCity(PublicModel city) {
    _citySelected = city;
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
    update();
  }

  void setSchool(School city) {
    _schoolSelected = city;
    update();
  }

  bool isValid() {
    bool isNameValid = fullNameController.text.isNotEmpty;
    bool isCityValid = citySelected != null;
    bool isSchoolValid = schoolSelected != null;
    bool isClassValid = classStudSelected != null;
    bool isValid = isNameValid && isCityValid && isSchoolValid && isClassValid;
    update();
    return isValid;
  }

  void setImageFile(File? file) {
    _imageFile = file;
    update();
  }

  void addChild() async {
    final fullName = fullNameController.text;
    final cityId = citySelected!.id;
    final schoolId = schoolSelected!.id;
    final classId = classStudSelected!.id;
    isLoading = true;
    update();
    int parentId = SharedPrefs.user!.id!;
    try {
      await _authUseCaseImp
          ?.addChild(
          parentId,
          fullName,
          schoolId ?? -1,
          cityId ?? -1,
          classId ?? '',
          imageFile)
          .then((value) {

            log("addChild value : ${value.toString()}");

        value?.fold((l) {
          BaseMixin.showToastFlutter(messsage: l.message);
        }, (r) {
          log("addChild 1");
          ChildUser newChild = r;
          log("addChild 2");
          User newUser = SharedPrefs.user!;
          log("addChild 3");
          newUser.children?.add(newChild);
          log("addChild 3");
          SharedPrefs.saveSelectedChild(newChild);
          log("addChild 3");
          SharedPrefs.saveUser(newUser,"");
          log("addChild 3");
          Get.find<ProfileController>().profileData?.children?.add(newChild);
          log("addChild 3");
          Get.back();
        });
        isLoading = false;
        update();
      });

      //   final completer = Completer<Either<ApiException, User>?>();
      //   final fcmToken = SharedPrefs.fcmToken ?? '';
      //   final deviceType = await DeviceInfoService.getDeviceType();
      //   final data = {
      //     "name": "test1 test2",
      //     "school_id": 4,
      //     "city_id": 1,
      //     "class_id": 46,
      //     "parentID": 2818,
      //   };
      //   dio.FormData formData = await dio.FormData.fromMap(data);
      //   if (imageFile != null) {
      //     formData.files.add(MapEntry(
      //       'image',
      //       await dio.MultipartFile.fromFile(imageFile!.path ?? '',filename: 'image.JPG'),
      //     ));
      //   }
      //   try {
      //     await ApiClient.requestData(
      //       endpoint: ApiConstant.registerChild(2818),
      //       requestType: RequestType.post,
      //       create: () => APIResponse<User>(
      //         create: () => User(),
      //       ),
      //       data: formData,
      //       headers: {
      //         'Content-Type': 'multipart/form-data; boundary=${formData.boundary}',
      //       },
      //       onSuccess: (response) {
      //         if (response.data?.status == false ?? false) {
      //           completer.complete(left(ApiException(
      //             message: response.data?.errors?.first.message ?? "",
      //             response: response.response,
      //           )));
      //         } else {
      //           final user = response.data?.item;
      //           completer.complete(Right(user ?? User()));
      //           if (user != null) {
      //             log("user : ${user.toJson()}");
      //           }
      //         }
      //       },
      //       onError: (error) {
      //         completer.complete(left(error));
      //       },
      //     );
      //   } on ApiException catch (error) {
      //     completer.complete(left(error));
      //   }
      // }catch(e){
      //   log("addChild e : $e");
      // }
    } catch (e) {
      log("e : $e");
    }
  }
}
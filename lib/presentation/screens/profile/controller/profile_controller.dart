import 'dart:developer';

import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/data/repository/profile_repository_remote.dart';
import 'package:shater/domain/usecase/profile_usecase_imp.dart';

import '../../../../core/controller/shared_prefrences.dart';
import '../../auth/sign in/controller/sign_in_controller.dart';

class ProfileController extends BaseController {
  ProfileUseCaseImp? _profileUseCaseImp;

  User? profileData;

  // User? get profileData => profileData;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    _profileUseCaseImp =
        ProfileUseCaseImp(ProfileRepositoryRemote(ApiClient()));
    // getProfile();
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

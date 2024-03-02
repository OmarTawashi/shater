import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/data/model/class_model.dart';
import 'package:shater/data/model/data_register_model.dart';
import 'package:shater/domain/usecase/public_usecase_imp.dart';
import 'package:shater/presentation/screens/auth/base%20login/controller/auth_controller.dart';
import 'package:shater/presentation/screens/auth/sign%20up/controller/sign_up_controller.dart';

import '../../../../core/network/api_client.dart';
import '../../../../data/repository/public_repository_remote.dart';

class ClasseController extends BaseController {
  publicUseCaseImp? _publicUseCaseImp;

  DataRegisterModel? _dataRegisterModels;
  DataRegisterModel? get dataRegisterModels => _dataRegisterModels;

  List<Classes> _classes = [];
  List<Classes> get classes => _classes;

  @override
  void onInit() {
    super.onInit();
    _publicUseCaseImp = publicUseCaseImp(PublicRepositoryRemote(ApiClient()));
    getFunUserType(Get.find<AuthController>().userType);
  }

  void getClassesStudent() async {
    final cityId = Get.find<SignUpController>().citySelected?.id;
    final schoolId = Get.find<SignUpController>().schoolSelected?.id;
    updateViewType(ViewType.loading);
    await _publicUseCaseImp
        ?.fetchClassStudent(cityId ?? -1, schoolId ?? -1)
        .then((value) {
      value?.fold((l) {
        updateViewType(ViewType.error);
      }, (r) {
        if (r == null) {
          updateViewType(ViewType.empty);
        } else {
          updateViewType(ViewType.success);
          _classes = r.country?.first.classes ?? [];
        }
      });

      update();
    });
  }

  void getClassesTeacher() async {
    int countryId = 18;
    final subject = Get.find<SignUpController>().subjectSlected?.title;
    updateViewType(ViewType.loading);
    await _publicUseCaseImp
        ?.fetchClassTeacher(subject ?? '', countryId)
        .then((value) {
      value?.fold((l) {
        updateViewType(ViewType.error);
      }, (r) {
        if (r == null) {
          updateViewType(ViewType.empty);
        } else {
          updateViewType(ViewType.success);
          _classes = r;
        }
      });

      update();
    });
  }

  void getFunUserType(AuthType type) {
    switch (type) {
      case AuthType.student:
        return getClassesStudent();
      case AuthType.teacher:
        return getClassesTeacher();
      default:
        return getClassesStudent();
    }
  }
}

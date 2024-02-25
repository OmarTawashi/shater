import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/data/model/data_register_model.dart';
import 'package:shater/domain/usecase/public_usecase_imp.dart';
import 'package:shater/presentation/screens/auth/sign%20up/controller/sign_up_controller.dart';

import '../../../../core/network/api_client.dart';
import '../../../../data/repository/public_repository_remote.dart';

class LeveController extends BaseController {
  publicUseCaseImp? _publicUseCaseImp;

  DataRegisterModel? _classes;
  DataRegisterModel? get classes => _classes;

  @override
  void onInit() {
    super.onInit();
    _publicUseCaseImp = publicUseCaseImp(PublicRepositoryRemote(ApiClient()));
    getLevel();
  }

  void getLevel() async {
    final cityId = Get.find<SignUpController>().citySelected?.id;
    final schoolId = Get.find<SignUpController>().schoolSelected?.id;
    updateViewType(ViewType.loading);
    await _publicUseCaseImp
        ?.fetchLevel(cityId ?? -1, schoolId ?? -1)
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
}

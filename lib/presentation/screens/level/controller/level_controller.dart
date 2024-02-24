import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/domain/usecase/public_usecase_imp.dart';

import '../../../../core/network/api_client.dart';
import '../../../../data/model/public_model.dart';
import '../../../../data/repository/public_repository_remote.dart';

class LeveController extends BaseController{
   publicUseCaseImp? _publicUseCaseImp;

  List<PublicModel> _levels = [];
  List<PublicModel> get levels => _levels;

  @override
  void onInit() {
    super.onInit();
    _publicUseCaseImp = publicUseCaseImp(PublicRepositoryRemote(ApiClient()));
    getLevel();
  }

  void getLevel() async {
    updateViewType(ViewType.loading);
    await _publicUseCaseImp?.fetchCity().then((value) {
      value?.fold((l) {
        updateViewType(ViewType.error);
      }, (r) {
        if (r.isEmpty) {
          updateViewType(ViewType.empty);
        } else {
          updateViewType(ViewType.success);
          _levels = r;
        }
      });

      update();
    });
  }
}
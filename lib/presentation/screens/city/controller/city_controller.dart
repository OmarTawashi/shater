import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/public_model.dart';
import 'package:shater/data/repository/public_repository_remote.dart';
import 'package:shater/domain/usecase/public_usecase_imp.dart';


class CityController extends BaseController {
  publicUseCaseImp? _publicUseCaseImp;

  List<PublicModel> _cities = [];
  List<PublicModel> get cities => _cities;

  @override
  void onInit() {
    super.onInit();
    _publicUseCaseImp = publicUseCaseImp(PublicRepositoryRemote(ApiClient()));
    getCities();
  }

  void getCities() async {
    updateViewType(ViewType.loading);
    await _publicUseCaseImp?.fetchCity().then((value) {
      value?.fold((l) {
        updateViewType(ViewType.error);
      }, (r) {
        if (r.isEmpty) {
          updateViewType(ViewType.empty);
        } else {
          updateViewType(ViewType.success);
          _cities = r;
        }
      });

      update();
    });
  }
}

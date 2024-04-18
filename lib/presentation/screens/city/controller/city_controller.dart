import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/public_model.dart';
import 'package:shater/data/repository/public_repository_remote.dart';
import 'package:shater/domain/usecase/public_usecase_imp.dart';


class CityController extends BaseController {
  PublicUseCaseImp? _publicUseCaseImp;

  List<PublicModel> _cities = [];
  List<PublicModel> get cities => _cities;

  @override
  void onInit() {
    super.onInit();
    _publicUseCaseImp = PublicUseCaseImp(PublicRepositoryRemote(ApiClient()));
    getCities();
  }

  void getCities() async {
    int countryId = 18;
    updateViewType(ViewType.loading);
    await _publicUseCaseImp?.fetchCity(
      countryId
    ).then((value) {
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

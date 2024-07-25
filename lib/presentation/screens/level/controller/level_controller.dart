import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/data_register_model.dart';
import 'package:shater/data/repository/public_repository_remote.dart';
import 'package:shater/domain/usecase/public_usecase_imp.dart';
import 'package:shater/presentation/screens/student/dashBord/controller/dashboard_controller.dart';

class LevelController extends BaseController {
  DataRegisterModel? _dataRegisterModels;
  DataRegisterModel? get dataRegisterModels => _dataRegisterModels;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;



  PublicUseCaseImp? _publicUseCaseImp;

  @override
  void onInit() {
    super.onInit();
    _publicUseCaseImp = PublicUseCaseImp(PublicRepositoryRemote(ApiClient()));
    getLevel();
  }

  void changeIndex(int index){
    _selectedIndex = index;
    update();
  }

  void getLevel() async {
    final dashController = Get.find<DashBoardController>();
    final cityId = dashController.user?.city?.id ?? -1;
    final schoolId = dashController.user?.school?.id ?? -1;
    updateViewType(ViewType.loading);
    await _publicUseCaseImp?.fetchClassStudent(cityId, schoolId).then((value) {
      value?.fold((l) {
        updateViewType(ViewType.error);
      }, (r) {
        updateViewType(ViewType.success);
        _dataRegisterModels = r;
            });

      update();
    });
  }
}

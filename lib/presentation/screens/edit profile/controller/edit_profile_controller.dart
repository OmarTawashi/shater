import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/core/controller/shared_prefrences.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/data/repository/auth_repository_remote.dart';
import 'package:shater/domain/usecase/auth_usecase_imp.dart';
import 'package:shater/presentation/screens/profile/controller/profile_controller.dart';
import 'package:shater/routes/app_routes.dart';

class EditProfileController extends GetxController {
  User? _user;
  User? get user => _user;

  AuthUseCaseImp? _authUseCaseImp;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    _authUseCaseImp = AuthUseCaseImp(AuthRepositoryRemote(ApiClient()));

    _user = Get.find<ProfileController>().user;
  }

  void setLoad(bool isLoad) {
    _isLoading = isLoad;
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
        await SharedPrefs.removeUser();
      });
      setLoad(true);

      update();
    });
  }
}

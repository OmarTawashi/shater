import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/data/model/school_model.dart';
import 'package:shater/domain/usecase/public_usecase_imp.dart';
import 'package:shater/presentation/screens/add%20child/controller/add_child_controller.dart';
import 'package:shater/presentation/screens/auth/sign%20up/controller/sign_up_controller.dart';

import '../../../../core/network/api_client.dart';
import '../../../../data/model/public_model.dart';
import '../../../../data/repository/public_repository_remote.dart';
import '../../edit profile/controller/edit_profile_controller.dart';

enum SchoolGender { male, female }

class SchoolController extends BaseController {
  final int typeFrom;
  PublicUseCaseImp? _publicUseCaseImp;

  List<School> _schools = [];

  SchoolController(this.typeFrom);
  List<School> get schools => _schools;

   SchoolGender _selectSchoolGender = SchoolGender.male;
  SchoolGender get selectSchoolGender => _selectSchoolGender;

  @override
  void onInit() {
    super.onInit();
    _publicUseCaseImp = PublicUseCaseImp(PublicRepositoryRemote(ApiClient()));
    getSchools(typeFrom);
  }

   void changeSchoolGender(SchoolGender schoolGender) {
    _selectSchoolGender = schoolGender;
    update();
  }

  void getSchools(int typeFrom) async {
    PublicModel? city ;
    if(typeFrom == 0){
      city = Get.find<SignUpController>().citySelected;
    }else if(typeFrom == 1){
      city = Get.find<AddChildController>().citySelected;
    }else{
      city = Get.find<EditProfileController>().citySelected;
    }
   
    updateViewType(ViewType.loading);
    await _publicUseCaseImp
        ?.fetchSchool(city?.id ?? -1, _selectSchoolGender.name)
        .then((value) {
      value?.fold((l) {
        updateViewType(ViewType.error);
      }, (r) {
        if (r.isEmpty) {
          updateViewType(ViewType.empty);
        } else {
          updateViewType(ViewType.success);
          _schools = r;
        }
      });

      update();
    });
  }
}

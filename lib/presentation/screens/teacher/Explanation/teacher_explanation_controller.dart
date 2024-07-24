import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/repository/dashboard_repository_remote.dart';
import 'package:shater/domain/usecase/dachboard_usercase_imp.dart';

import '../../../../data/model/class_model.dart';
import '../../../../data/model/course_learning_model.dart';
import '../../../../data/repository/public_repository_remote.dart';
import '../../../../domain/usecase/public_usecase_imp.dart';
import '../teacher dashborad/controller/teacher_dashboard_controller.dart';

class TeacherExplanationController  extends BaseController{
  DashBaoardUseCaseImp? _dashBaoardUseCaseImp;
  PublicUseCaseImp? _publicUseCaseImp;

  List<CourseLearningModel> _subjects = [];
  List<CourseLearningModel> get subjects => _subjects;

  List<Classes> _classes = [];
  List<Classes> get classes => _classes;

  @override
  void onInit() {
    super.onInit();
    _dashBaoardUseCaseImp =
        DashBaoardUseCaseImp(DashBoardRepositoryRemote(ApiClient()));
    _publicUseCaseImp = PublicUseCaseImp(PublicRepositoryRemote(ApiClient()));

    teacherCoursesList();
  }

  Classes? getClassForItem(int? id){
    return this.classes.firstWhere((element) => element.id == '$id');
  }

  void teacherCoursesList() async {
    final dashController = Get.find<TeacherDashBoardController>();

    updateViewType(ViewType.loading);
    await _dashBaoardUseCaseImp?.teacherCoursesList(dashController.level?.id ?? -1).then((value) {
      value?.fold((l) {
        updateViewType(ViewType.error);
      }, (s) {
        if (s.isEmpty) {
          updateViewType(ViewType.empty);
        } else {
          updateViewType(ViewType.success);
          _subjects = s;
        }
      });
      update();
    });
  }

}
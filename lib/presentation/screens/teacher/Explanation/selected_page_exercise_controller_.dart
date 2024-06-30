import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/specific_page_exercises_model.dart';
import 'package:shater/data/repository/teacher_repository_remote.dart';
import 'package:shater/domain/usecase/teacher_usecase_imp.dart';

class SelectedPageExerciseControoler extends BaseController {
  TeacherUseCaseImp? _teacherUseCaseImp;
  SpecificPageExercisesModel? specificPageExercisesModel;

  @override
  void onInit() {
    _teacherUseCaseImp =
        TeacherUseCaseImp(TeacherRepositoryRemote(ApiClient()));

    super.onInit();
  }

  getSpecificPageExercisesModelList(
      {required int subject_id,
      required int pageFrom,
      required int PageTo}) async {
    updateViewType(ViewType.loading);

    await _teacherUseCaseImp
        ?.getSpecificPageExercisesList(
            subject_id: subject_id, pageFrom: pageFrom, PageTo: PageTo)
        .then(
      (value) {
        value?.fold(
          (l) {
            updateViewType(ViewType.error);
          },
          (response) async {
            if (response.items!.isEmpty) {
              updateViewType(ViewType.empty);
            } else {
              specificPageExercisesModel = response;
              updateViewType(ViewType.success);
              print(
                  "*///*/*/*/*/*/*/*/*/*/*/********************************//*/////////////*");
              print(
                  "///////////////${specificPageExercisesModel!.items!.first.questions!.length}");

              print(
                  "*///*/*/*/*/*/*/*/*/*/*/********************************//*/////////////*");
            }
          },
        );
        update();
      },
    );
  }
}

class SelectedPageExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectedPageExerciseControoler());
  }
}

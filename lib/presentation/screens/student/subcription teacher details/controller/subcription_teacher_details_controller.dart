import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/subject_video_model.dart';
import 'package:shater/data/repository/teacher_repository_remote.dart';
import 'package:shater/domain/usecase/teacher_usecase_imp.dart';
import 'package:shater/presentation/screens/student/teacher/controller/teacher_controller.dart';

class SubcriptionTeacherDetailsController extends BaseController {
  TeacherController? teacherController;
  TeacherUseCaseImp? _teacherUseCaseImp;

  List<SubjectVideo> _subjectVideos = [];
  List<SubjectVideo> get subjectVideos => _subjectVideos;

  @override
  void onInit() {
    super.onInit();
    teacherController = Get.find<TeacherController>();
    _teacherUseCaseImp =
        TeacherUseCaseImp(TeacherRepositoryRemote(ApiClient()));
    fetchVideoOfSubject();
  }

  void fetchVideoOfSubject() async {
    final teacher = teacherController?.teacherSelected;
    int? subjectId = teacher?.subjectId;
    int? teacherID = teacher?.id;
    int? page = 1;
    int? publishTo = 1;
    updateViewType(ViewType.loading);
    await _teacherUseCaseImp
        ?.fetchVideoOfSubject(page, subjectId, teacherID, publishTo)
        .then((value) {
      value?.fold((l) {
        handelError(l);
      }, (r) {
        if (r.isEmpty) {
          updateViewType(ViewType.empty);
        } else {
          updateViewType(ViewType.success);
          _subjectVideos = r;
          update();
        }
      });

      update();
    });
  }
}

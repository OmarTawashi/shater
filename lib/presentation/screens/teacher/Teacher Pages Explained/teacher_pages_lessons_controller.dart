import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/controller/shared_prefrences.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/subject_video_model.dart';
import 'package:shater/data/repository/dashboard_repository_remote.dart';
import 'package:shater/data/repository/teacher_repository_remote.dart';
import 'package:shater/domain/usecase/dachboard_usercase_imp.dart';
import 'package:shater/domain/usecase/teacher_usecase_imp.dart';
import '../../../../data/model/class_model.dart';
import '../../../../data/model/course_learning_model.dart';
import '../../../../data/repository/public_repository_remote.dart';
import '../../../../domain/usecase/public_usecase_imp.dart';
import '../teacher dashborad/controller/teacher_dashboard_controller.dart';

class TeacherPagesLessonsController extends BaseController {
  DashBaoardUseCaseImp? _dashBaoardUseCaseImp;
  PublicUseCaseImp? _publicUseCaseImp;
  TeacherUseCaseImp? _teacherUseCaseImp;
  List<CourseLearningModel> _subjects = [];
  List<CourseLearningModel> get subjects => _subjects;
  List<SubjectVideo> _vedioSubjectTeacher = [];
  List<SubjectVideo> get vedioSubjectTeacher => _vedioSubjectTeacher;
  // List<VedioSubjectTeacher> get vedioSubjectTeacher => _vedioSubjectTeacher;

  List<Classes> _classes = [];
  List<Classes> get classes => _classes;

  @override
  void onInit() {
    super.onInit();
    _dashBaoardUseCaseImp =
        DashBaoardUseCaseImp(DashBoardRepositoryRemote(ApiClient()));
    _publicUseCaseImp = PublicUseCaseImp(PublicRepositoryRemote(ApiClient()));
    _teacherUseCaseImp =
        TeacherUseCaseImp(TeacherRepositoryRemote(ApiClient()));

    getClassesStudent();
    fetchTeacherCoursesLesson();
  }

  Classes? getClassForItem(int? id) {
    return this.classes.firstWhere((element) => element.id == '$id');
  }

  void getClassesStudent() async {
    final dashController = Get.find<TeacherDashBoardController>();
    final cityId = dashController.user?.city?.id;
    final schoolId = dashController.user?.school?.id;
    final dataRegister = SharedPrefs.dataRegister;

    if (dataRegister?.country?.first != null) {
      _classes = dataRegister?.country?.first.classes ?? [];
      this.populateData();
      update();
    } else {
      await _publicUseCaseImp
          ?.fetchClassStudent(cityId ?? -1, schoolId ?? -1)
          .then((value) {
        value?.fold((l) {
          updateViewType(ViewType.error);
        }, (r) {
          if (r == null) {
            updateViewType(ViewType.empty);
          } else {
            updateViewType(ViewType.success);
            _classes = r.country?.first.classes ?? [];
            this.populateData();
          }
        });

        update();
      });
    }
  }

  void fetchTeacherCoursesLesson() async {
    final dashController = Get.find<TeacherDashBoardController>();
    updateViewType(ViewType.loading);
    await _dashBaoardUseCaseImp
        ?.fetchTeacherCoursesLesson(dashController.level?.id ?? -1)
        .then((value) {
      value?.fold((l) {
        updateViewType(ViewType.error);
      }, (s) {
        if (s.isEmpty) {
          updateViewType(ViewType.empty);
        } else {
          updateViewType(ViewType.success);
          _subjects = s;
          this.populateData();
        }
      });
      update();
    });
  }

  dynamic _user = SharedPrefs.user;

  fetchVideosforSubject2({
    required int page,
    required int subjectId,
    // required int userID,
    required int publishTo,
  }) async {
    updateViewType(ViewType.loading);
    await _teacherUseCaseImp
        ?.fetchVideoOfSubject2(
            publishTo: publishTo, subjectId: subjectId, userID: _user!.id!)
        .then((value) {
      value?.fold((l) {
        updateViewType(ViewType.error);
      }, (response) {
        if (response.isEmpty) {
          updateViewType(ViewType.empty);
        } else {
          updateViewType(ViewType.success);
          _vedioSubjectTeacher = response;

          this.populateData();
          return _vedioSubjectTeacher;
        }
      });
      update();
    });
  }

  void populateData() {
    var isEmpty = (this.classes ?? []).isEmpty;
    _subjects.forEach(
      (element) {
        if (!isEmpty) {
          element.classes = this.getClassForItem(element.classId);
        }
      },
    );
  }
}

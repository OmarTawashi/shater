import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/course_learning_model.dart';
import 'package:shater/data/model/teacher_model.dart';
import 'package:shater/data/repository/teacher_repository_remote.dart';
import 'package:shater/domain/usecase/teacher_usecase_imp.dart';
import 'package:shater/presentation/screens/student/subject/controller/subjects_controller.dart';
import 'package:shater/routes/app_routes.dart';

class TeacherController extends BaseController {
  TeacherUseCaseImp? _teacherUseCaseImp;

  SubjectController subjectController = Get.find<SubjectController>();
  int selectedTapIndex = 0;

  List<String> _subjects = ['all'];
  List<String> get subjects => _subjects;

  List<CourseLearningModel> _courses = [];
  List<CourseLearningModel> get courses => _courses;

  CourseLearningModel? _courseSelected;
  CourseLearningModel? get courseSelected => _courseSelected;

  TeacherModel? _teacherSelected;
  TeacherModel? get teacherSelected => _teacherSelected;

  List<TeacherModel> _teachers = [];
  List<TeacherModel> get teachers => _teachers;

  @override
  void onInit() {
    super.onInit();
    _teacherUseCaseImp =
        TeacherUseCaseImp(TeacherRepositoryRemote(ApiClient()));
    getTeachers();
  }

  void changeTapIndex(int index) {
    selectedTapIndex = index;
    update();
  }

  void setTeacher(TeacherModel teacher) {
    _teacherSelected = teacher;
    update();
  }

  iniGetSubject() {
    _courses = subjectController.courseLearningModel;
    _courses.forEach((element) {
      if (!_subjects.contains(element.title)) {
        _subjects.add(element.title ?? '');
      }
    });
  }

  CourseLearningModel getSubjectOfEachTeacher(int? subId) {
    return courses.firstWhere(
      (element) => element.id == subId,
    );
  }

  void getCourseSelected(int index) {
    _courses.forEach((element) {
      if (element.id == _teachers[index].subjectId) {
        _courseSelected = element;
      }
    });
    update();
  }

  void getTeachers() async {
    final subjectId = _courseSelected?.id;
    updateViewType(ViewType.loading);
    await _teacherUseCaseImp?.fetchTeachers(105).then((value) {
      value?.fold((l) {
        handelError(l);
      }, (r) {
        if (r.isEmpty) {
          updateViewType(ViewType.empty);
        } else {
          updateViewType(ViewType.success);
          _teachers = r ?? [];
        }
      });

      update();
    });
  }

  void sendReadTeacher(int? teacherID) async {
    await _teacherUseCaseImp?.sendTeacherRead(teacherID).then((value) {
      value?.fold((l) {
        handelError(l);
      }, (r) {
        print(r);
      });

      update();
    });
  }
}

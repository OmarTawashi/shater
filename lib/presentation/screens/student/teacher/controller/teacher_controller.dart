import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/course_learning_model.dart';
import 'package:shater/data/model/teacher_model.dart';
import 'package:shater/data/repository/teacher_repository_remote.dart';
import 'package:shater/domain/usecase/teacher_usecase_imp.dart';
import 'package:shater/presentation/screens/student/subject/controller/subjects_controller.dart';

class TeacherController extends BaseController {
  TeacherUseCaseImp? _teacherUseCaseImp;

  int selectedTapIndex = 0;

  List<String> _subjects = ['all'];
  List<String> get subjects => _subjects;

  List<CourseLearningModel> _courses = [];
  List<CourseLearningModel> get courses => _courses;

  CourseLearningModel? _courseSelected;
  CourseLearningModel? get courseSelected => _courseSelected;

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

  iniGetSubject(SubjectController controller) {
    _courses = controller.courseLearningModel;
    _courses.forEach((element) {
      if (!_subjects.contains(element.title)) {
        _subjects.add(element.title ?? '');
      }
    });
  }

  void getCourseSelected(int index) {
    final seleCourse =
        _courses.firstWhere((element) => selectedTapIndex == index);
    _courseSelected = seleCourse;
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
}

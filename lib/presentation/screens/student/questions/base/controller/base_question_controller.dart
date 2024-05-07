import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/subcription%20teacher%20details/controller/subcription_teacher_details_controller.dart';
import 'package:shater/routes/app_routes.dart';

enum BaseQuestionTap { question, lesson }

class BaseQuestionController extends GetxController {
  BaseQuestionTap _selectTap = BaseQuestionTap.question;
  BaseQuestionTap get selectTap => _selectTap;

  SubcriptionTeacherDetailsController? _subcriptionTeVideController;
  SubcriptionTeacherDetailsController? get subcriptionTeVideController =>
      _subcriptionTeVideController;

  String? _routeGIT;
  String? get routeGIT => _routeGIT;

  void changTap(BaseQuestionTap type) {
    _selectTap = type;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _routeGIT = Get.previousRoute;
    if (_routeGIT == Routes.getPageSubjectScreen()) {
    } else {
      _subcriptionTeVideController =
          Get.find<SubcriptionTeacherDetailsController>();
    }
  }
}

import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/pages%20subject/controller/page_subject_controller.dart';

class PageSubjectBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PageSubjectController());
  }

}
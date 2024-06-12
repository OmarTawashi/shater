import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shater/core/controller/shared_prefrences.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/result_exam_model.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/data/repository/profile_repository_remote.dart';
import 'package:shater/domain/usecase/profile_usecase_imp.dart';
import 'package:shater/presentation/screens/profile/controller/profile_controller.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:shater/presentation/screens/student/result/controller/result_controller.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/api_constant.dart';

class ResultSubjectController extends GetxController {
  ProfileUseCaseImp? _profileUseCaseImp;

  ResultController? _resultController;
  ResultController? get resultController => _resultController;

  ResultExam? _resultExam;
  ResultExam? get resultExam => _resultExam;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  User? _user;
  User? get user => _user;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _resultController = Get.find<ResultController>();
    _profileUseCaseImp = ProfileUseCaseImp(ProfileRepositoryRemote(ApiClient()));
    _user = SharedPrefs.user;
    if (Get.previousRoute == RoutesName.baseQuestionScreen) {
      _resultExam = Get.find<QuestionController>().resultExam;
    } else {
      _resultExam = _resultController?.resultExamSelected;
    }
    print(_resultExam);
  }

  void setLoad(bool isLoad) {
    _isLoading = isLoad;
    update();
  }

  void shareExam() async {
    final exam = _resultExam?.id;
    setLoad(true);

    await _profileUseCaseImp?.shareExam(exam).then((value) {
      value?.fold((l) {}, (r) {});
    });
  }

  void showActivityShare() async {
    final name = SharedPrefs.user?.name;
    final examTitle = _resultExam?.title;
    final textView = "view_results".tr + "\t$name" "\t$examTitle";
    // final share = await Share.shareUri(Uri.parse('${ApiConstant.baseUrl}'));
    final share = await Share.shareUri(Uri.parse(
        '${ApiConstant.baseUrl + '/shareExamResult/${_resultExam?.lastExam?.id}/${_resultExam?.lastExam?.studentId}'}'));
    // final share = await Share.share(textView);
    if (share.status == ShareResultStatus.success) {
    } else if (share.status == ShareResultStatus.dismissed) {
    } else if (share.status == ShareResultStatus.unavailable) {}
    update();
  }
  /* Share.shareUri(Uri.parse(
        '${ApiConstant.baseUrl + ApiConstant.shareExam}/$_resultExam'));*/
}

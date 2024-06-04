import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:video_player/video_player.dart';

class CongrlateController extends GetxController {
  late VideoPlayerController videoController;
  QuestionController? questionController;

  @override
  void onInit() {
    super.onInit();
    questionController = Get.find<QuestionController>();
    videoController =
        VideoPlayerController.asset(questionController?.congrlateText ?? '');
    videoController.initialize();
    videoController.play();
  }

  @override
  void onClose() {
    super.onClose();
    videoController.dispose();
  }
}

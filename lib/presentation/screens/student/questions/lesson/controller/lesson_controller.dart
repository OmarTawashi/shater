import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/controller/shared_prefrences.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/comment_model.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/data/repository/lesson_repository_remote.dart';
import 'package:shater/domain/usecase/lesson_usecase_imp.dart';
import 'package:shater/presentation/screens/student/subcription%20teacher%20details/controller/subcription_teacher_details_controller.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:video_player/video_player.dart';

class LessonController extends BaseController {
  LessonUseCaseImp? _lessonUseCaseImp;

  TextEditingController messageController = TextEditingController();

  bool _isLoadingMessage = false;
  bool get isLoadingMessage => _isLoadingMessage;

  late VideoPlayerController videoController;
  late Future<void> initializeVideoPlayerFuture;

  SubcriptionTeacherDetailsController? _subcriptionTeVideController;
  SubcriptionTeacherDetailsController? get subcriptionTeVideController =>
      _subcriptionTeVideController;

  List<CommentModel> _comments = [];
  List<CommentModel> get comments => _comments;

  double _ratingVideo = 0;
  double get ratingVideo => _ratingVideo;

  @override
  void onInit() {
    super.onInit();
    if (Get.previousRoute == Routes.getPageSubjectScreen()) {
    } else {
      _subcriptionTeVideController =
          Get.find<SubcriptionTeacherDetailsController>();
      videoController = VideoPlayerController.networkUrl(Uri.parse(
          _subcriptionTeVideController?.subjectVideoSelected?.url ?? ''));
      initializeVideoPlayerFuture = videoController.initialize();
      _lessonUseCaseImp = LessonUseCaseImp(LessonRepositoryRemote(ApiClient()));
      fetchComments();
    }
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }

  void changeLoad(bool isLoading) {
    _isLoadingMessage = isLoading;
    update();
  }

  void setRate(double rate) {
    _ratingVideo = rate;
    update();
  }

  void powerVideo() {
    if (videoController.value.isPlaying) {
      videoController.pause();
    } else {
      videoController.play();
    }
    update();
  }

  void fetchComments() async {
    final videoID = _subcriptionTeVideController?.subjectVideoSelected?.id;
    await _lessonUseCaseImp?.fetchComment(videoID).then((value) {
      value?.fold((l) {
        handelError(l);
      }, (r) {
        _comments = r;
      });

      update();
    });
  }

  void sendMessage() async {
    final videoID = _subcriptionTeVideController?.subjectVideoSelected?.id;
    User? _user = SharedPrefs.user;
    final comment = CommentModel(
      comment: messageController.text,
      user: _user,
      userId: _user?.id,
      videoId: videoID,
    );
    changeLoad(true);

    await _lessonUseCaseImp
        ?.sendComment(videoID, comment.comment)
        .then((value) {
      value?.fold((l) {
        changeLoad(false);
      }, (r) {
        comments.add(comment);
        changeLoad(false);
        messageController.clear();
      });
    });
    if (comments.contains(comment) == true) {
      messageController.clear();
    }
    update();
  }

  void sendRateVideo() async {
    final videoID = _subcriptionTeVideController?.subjectVideoSelected?.id;
    final teacherID =
        _subcriptionTeVideController?.subjectVideoSelected?.user?.id;
    final rate = ratingVideo;
    changeLoad(true);

    await _lessonUseCaseImp
        ?.sendRatingVideo(teacherID, videoID, rate)
        .then((value) {
      value?.fold((l) {
        changeLoad(false);
      }, (r) {
        changeLoad(false);
        setRate(0);
        Get.back();
      });
    });
  }
}

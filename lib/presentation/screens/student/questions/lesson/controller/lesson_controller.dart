import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/controller/shared_prefrences.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/comment_model.dart';
import 'package:shater/data/model/teacher_exercise_model.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/data/repository/lesson_repository_remote.dart';
import 'package:shater/domain/usecase/lesson_usecase_imp.dart';
import 'package:shater/presentation/screens/student/pages%20subject/controller/page_subject_controller.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
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
  SubcriptionTeacherDetailsController? get subcriptionTeVideController => _subcriptionTeVideController;

  PageSubjectController? _pageSubjectController;
  PageSubjectController? get pageSubjectController => _pageSubjectController;

  QuestionController? _questionController;
  QuestionController? get questionController => _questionController;

  List<CommentModel> _comments = [];
  List<CommentModel> get comments => _comments;

  List<TeacherExerciseModel> _videoPage = [];
  List<TeacherExerciseModel> get videoPage => _videoPage;

  TeacherExerciseModel? _videoPageSelected;
  TeacherExerciseModel? get videoPageSelected => _videoPageSelected;

  double _ratingVideo = 0;
  double get ratingVideo => _ratingVideo;

  String? _route;
  String? get route => _route;

  @override
  void onInit() {
    _lessonUseCaseImp = LessonUseCaseImp(LessonRepositoryRemote(ApiClient()));
    setRoute(Get.previousRoute);
    initFun();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   videoController.dispose();
  //   super.onClose();
  // }
  void setVideoPage(TeacherExerciseModel videoPG) {
    _videoPageSelected = videoPG;
    videoController = VideoPlayerController.networkUrl(Uri.parse(_videoPageSelected?.url ?? ''))
      ..setVolume(1);
    initializeVideoPlayerFuture = videoController.initialize();
    update();
  }

  void initFun() {
    switch (route) {
      case RoutesName.pageSubjectScreen:
        initExerciseFun();
        break;
      case RoutesName.subcriptionTeacherDetailsScreen:
        initTeacherFun();
        break;
    }
  }

  void changeLoad(bool isLoading) {
    _isLoadingMessage = isLoading;
    update();
  }

  void setRoute(String route) {
    _route = route;
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

  void initTeacherFun() {
    _subcriptionTeVideController = Get.find<SubcriptionTeacherDetailsController>();
    videoController = VideoPlayerController.networkUrl(
        Uri.parse(_subcriptionTeVideController?.subjectVideoSelected?.url ?? ''));
    initializeVideoPlayerFuture = videoController.initialize();
    fetchComments();
  }

  void initExerciseFun() {
    _pageSubjectController = Get.find<PageSubjectController>();
    _questionController = Get.find<QuestionController>();
    fetchVideoPage();
  }

  void fetchComments() async {
    int? videoID;
    switch (route) {
      case RoutesName.pageSubjectScreen:
        _comments = videoPageSelected?.comments ?? [];
        break;
      case RoutesName.subcriptionTeacherDetailsScreen:
        videoID = _subcriptionTeVideController?.subjectVideoSelected?.id;
        await _lessonUseCaseImp?.fetchComment(videoID).then((value) {
          value?.fold((l) {
            handelError(l);
          }, (r) {
            _comments = r;
          });

          update();
        });
        break;
    }
  }

  void fetchVideoPage() async {
    int? pageID;
    int? subjectID;
    pageID = _questionController?.questionModel?.pageId;
    subjectID = _questionController?.questionModel?.subjectId;
    updateViewType(ViewType.loading);
    await _lessonUseCaseImp?.fetchVideoPage(pageID, subjectID).then((value) {
      value?.fold((l) {
        handelError(l);
      }, (r) {
        _videoPage = r;
        final comments = r.firstWhere((element) => element.pageId == pageID);
        _comments = comments.comments ?? [];
        updateViewType(ViewType.success);
      });

      update();
    });
  }

  void sendMessage() async {
    int? videoID;
    switch (route) {
      case RoutesName.pageSubjectScreen:
        videoID = videoPageSelected?.id;
        break;
      case RoutesName.subcriptionTeacherDetailsScreen:
        videoID = _subcriptionTeVideController?.subjectVideoSelected?.id;
        break;
    }
    User? _user = SharedPrefs.user;
    final comment = CommentModel(
      comment: messageController.text,
      user: _user,
      userId: _user?.id,
      videoId: videoID,
    );
    changeLoad(true);

    await _lessonUseCaseImp?.sendComment(videoID, comment.comment).then((value) {
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
    int? videoID;
    int? teacherID;
    switch (route) {
      case RoutesName.pageSubjectScreen:
        videoID = videoPageSelected?.id;
        teacherID = videoPageSelected?.userId;
        break;
      case RoutesName.subcriptionTeacherDetailsScreen:
        videoID = _subcriptionTeVideController?.subjectVideoSelected?.id;
        teacherID = _subcriptionTeVideController?.subjectVideoSelected?.user?.id;
        break;
    }

    final rate = ratingVideo;
    changeLoad(true);

    await _lessonUseCaseImp?.sendRatingVideo(teacherID, videoID, rate).then((value) {
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

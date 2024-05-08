import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/lesson_repository.dart';
import 'package:shater/core/usecase/lesson_usecase.dart';
import 'package:shater/data/model/comment_model.dart';
import 'package:shater/data/model/empty_model.dart';

class LessonUseCaseImp extends LessonUseCase {
  final LessonRepository _lessonRepository;

  LessonUseCaseImp(this._lessonRepository);

  @override
  Future<Either<ApiException, List<CommentModel>>?> fetchComment(int? videoID) {
    return _lessonRepository.fetchComment(videoID);
  }

  @override
  Future<Either<ApiException, EmptyModel>?> sendComment(
      int? videoID, String? comment) {
    return _lessonRepository.sendComment(videoID, comment);
  }

  @override
  Future<Either<ApiException, EmptyModel>?> sendRatingVideo(
      int? teacherID, int? videoID, double? rate) {
    return _lessonRepository.sendRatingVideo(teacherID, videoID, rate);
  }
}

import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/comment_model.dart';
import 'package:shater/data/model/empty_model.dart';

abstract class LessonUseCase {
  Future<Either<ApiException, List<CommentModel>>?> fetchComment(int? videoID);
  Future<Either<ApiException, EmptyModel>?> sendComment(
      int? videoID, String? comment);
  Future<Either<ApiException, EmptyModel>?> sendRatingVideo(
      int? teacherID, int? videoID, double? rate);
}

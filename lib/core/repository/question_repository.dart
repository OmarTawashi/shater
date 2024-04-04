
import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/page_model.dart';
import 'package:shater/data/model/question_subject_model.dart';

abstract class QuestionRepository {
   Future<Either<ApiException, PageModel>?> fetchQuestionPage(int? subjectID);
   Future<Either<ApiException, List<QuestionPageModel>>?> fetchQuestionSubject(int? subjectID,int? pageFrom,int? pageTo);

}
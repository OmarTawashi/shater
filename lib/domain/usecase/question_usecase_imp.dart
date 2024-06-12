import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/question_repository.dart';
import 'package:shater/core/usecase/question_usecase.dart';
import 'package:shater/data/model/page_model.dart';
import 'package:shater/data/model/question_subject_model.dart';
import 'package:shater/data/model/result_exam_model.dart';

class QuestionUseCaseImp extends QuestionUseCase {
  final QuestionRepository _questionRepository;

  QuestionUseCaseImp(this._questionRepository);

  @override
  Future<Either<ApiException, PageModel>?> fetchQuestionPage(int? subjectID) {
    return _questionRepository.fetchQuestionPage(subjectID);
  }

  @override
  Future<Either<ApiException, List<QuestionPageModel>>?> fetchQuestionSubject(
      int? subjectID, int? pageFrom, int? pageTo) {
    return _questionRepository.fetchQuestionSubject(subjectID, pageFrom, pageTo);
  }

  @override
  Future<Either<ApiException, Exam>?> fetchResultQuestion(
      int? subjectID, int? pageFrom, int? pageTo, int? total, String data, int? helpAnswer) {
    return _questionRepository.fetchResultQuestion(subjectID, pageFrom, pageTo, total, data, helpAnswer);
  }
}

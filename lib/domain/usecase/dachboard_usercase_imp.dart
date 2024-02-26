import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/dashboard_repository.dart';
import 'package:shater/data/model/subject_model.dart';

class DashBaoardUseCaseImp extends DashBoardRepository {
  final DashBoardRepository _dashBoardRepository;

  DashBaoardUseCaseImp(this._dashBoardRepository);

  @override
  Future<Either<ApiException, List<Subject>>?> fetchSubject() {
   return _dashBoardRepository.fetchSubject();
  }

 
}
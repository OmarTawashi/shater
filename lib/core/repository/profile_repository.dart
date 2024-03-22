
import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/user.dart';

abstract class ProfileRepository {
   Future<Either<ApiException, User>?> fetchProfile();

}
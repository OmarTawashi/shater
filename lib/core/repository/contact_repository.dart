import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/contact_model.dart';
import 'package:shater/data/model/contact_store_model.dart';
import 'package:shater/data/model/empty_model.dart';

abstract class ContactRepository {
  Future<Either<ApiException, MessgaesResponseModel>?> fetchContactList();
  Future<Either<ApiException, ContactStoreModel>?> fetchContactStore(
      String? details);
  Future<Either<ApiException, EmptyModel>?> sendReplayMessage(
      int? idParent, String? text);
}

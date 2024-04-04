import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/contact_repository.dart';
import 'package:shater/core/usecase/contact_usecase.dart';
import 'package:shater/data/model/contact_model.dart';
import 'package:shater/data/model/contact_store_model.dart';
import 'package:shater/data/model/empty_model.dart';

class ContactUseCaseImp extends ContactUseCase {
  final ContactRepository _contactRepository;

  ContactUseCaseImp(this._contactRepository);

  @override
  Future<Either<ApiException, MessgaesResponseModel>?> fetchContactList() {
    return _contactRepository.fetchContactList();
  }
  @override
  Future<Either<ApiException, ContactStoreModel>?> fetchContactStore(String? details) {
    return _contactRepository.fetchContactStore(details);
  }

  @override
  Future<Either<ApiException, EmptyModel>?> sendReplayMessage(int? idParent, String? text) {
  return _contactRepository.sendReplayMessage(idParent, text);
  }
}

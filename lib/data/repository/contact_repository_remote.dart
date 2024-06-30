import 'dart:async';
import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/contact_repository.dart';
import 'package:shater/data/model/contact_model.dart';
import 'package:shater/data/model/contact_store_model.dart';
import 'package:shater/data/model/empty_model.dart';
import 'package:shater/util/api_constant.dart';
import '../../core/network/api_client.dart';
import '../../core/network/api_response.dart';

class ContactRepositoryRemote extends ContactRepository {
  final ApiClient _apiClient;

  ContactRepositoryRemote(this._apiClient);

  @override
  Future<Either<ApiException, MessgaesResponseModel>?>
      fetchContactList() async {
    final completer = Completer<Either<ApiException, MessgaesResponseModel>?>();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.contactList,
        requestType: RequestType.get,
        create: () => APIResponse<MessgaesResponseModel>(
          create: () => MessgaesResponseModel(),
        ),
        onSuccess: (response) {
          final data = response.data?.item;
          if (data != null) {
            completer.complete(right(data));
          }
        },
        onError: (error) {
          completer.complete(left(error));
        },
      );
    } on ApiException catch (error) {
      completer.complete(left(error));
    }
    return completer.future;
  }

  @override
  Future<Either<ApiException, ContactStoreModel>?> fetchContactStore(
      String? details) async {
    final completer = Completer<Either<ApiException, ContactStoreModel>?>();
    final data = {"details": details};
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.contactStore,
        requestType: RequestType.post,
        create: () => APIResponse<ContactStoreModel>(
          create: () => ContactStoreModel(),
        ),
        data: data,
        onSuccess: (response) {
          final data = response.data?.item;
          if (data != null) {
            completer.complete(right(data));
          }
        },
        onError: (error) {
          completer.complete(left(error));
        },
      );
    } on ApiException catch (error) {
      completer.complete(left(error));
    }
    return completer.future;
  }

  @override
  Future<Either<ApiException, EmptyModel>?> sendReplayMessage(
      int? idParent, String? text) async {
    final completer = Completer<Either<ApiException, EmptyModel>?>();
    final data = {"text": text};
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.replayContact + "/${idParent}" + '/reply',
        requestType: RequestType.post,
        create: () => APIResponse<EmptyModel>(
          create: () => EmptyModel(),
        ),
        data: data,
        onSuccess: (response) {
          final data = response.data?.item;
          if (data != null) {
            completer.complete(right(data));
          }
        },
        onError: (error) {
          completer.complete(left(error));
        },
      );
    } on ApiException catch (error) {
      completer.complete(left(error));
    }
    return completer.future;
  }
}

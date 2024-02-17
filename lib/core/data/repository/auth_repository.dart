import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/core/network/api_response.dart';

import '../../../config/api_constant.dart';
import '../../../model/user.dart';

class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository(this._apiClient);

  Future<User?> signInWithEmailPassword( String email, String password) async {
    await ApiClient.requestData(
      endpoint: ApiConstant.studentLogin,
      requestType: RequestType.post,
      create: () => APIResponse<User>(
        create: () => User(),
      ),
      data: {
        "email": email,
        "password": password,
      },
      onSuccess: (response) {
        return response.data?.item;
      },
      onError: (error) {
        switch (error.statusCode) {
          case 404:
            BaseMixin.showToastFlutter( messsage: 'not_found');
            break;
          case 500:
            BaseMixin.showToastFlutter(messsage: 'server_error');
            break;
          default:
          BaseMixin.showToastFlutter( messsage: 'Error Please Try Again');
           break;
        }
      },
    );
  }

  Future<void> signOut() async {
    throw UnimplementedError();
  }
}

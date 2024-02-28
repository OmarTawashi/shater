import 'package:shater/core/controller/base_controller.dart';

enum AuthType { student, teacher }

class AuthController extends BaseController {
  AuthType _userType = AuthType.student;
  AuthType get userType => _userType;

  String _htmlData = '';
  String get htmlData => _htmlData;

  void changeAuthType(AuthType type) {
    _userType = type;
    update();
  }

 
}

import 'package:flutter/services.dart';
import 'package:shater/core/controller/base_controller.dart';

enum AuthType { student, teacher }

class AuthController extends BaseController {
  AuthType setUserType = AuthType.student;
  AuthType get userType => setUserType;

  String _htmlData = '';
  String get htmlData => _htmlData;

  void changeAuthType(AuthType type) {
    setUserType = type;
    update();
  }

  Future<String?> convertHtmlToText(bool isPrivacy) async {
    String htmlFileName =
        isPrivacy ? 'assets/privacy.html' : 'assets/terms.html';
    updateViewType(ViewType.loading);
    await rootBundle.loadString(htmlFileName).then((value) {
      _htmlData = value;
      update();
      updateViewType(ViewType.success);
    });

    return _htmlData;
  }
}

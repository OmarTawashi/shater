import 'package:flutter/services.dart';
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

import 'package:shater/presentation/screens/auth/base%20login/controller/auth_controller.dart';
import 'package:shater/routes/app_routes.dart';


extension AuthTypeExtension on AuthType {
  String get title {
    switch (this) {
      case AuthType.student:
        return 'create_new_acount_student';
      case AuthType.teacher:
        return 'create_new_acount_teacher';
      default:
        return 'create_new_acount_student';
    }
  }

  String get user {
    switch (this) {
      case AuthType.student:
        return 'student';
      case AuthType.teacher:
        return 'teacher';
      default:
        return 'student';
    }
  }

  String get routesGO {
    switch (this) {
      case AuthType.student:
        return Routes.getCityScreen();
      case AuthType.teacher:
        return Routes.getSubjectTeacherScreen();
      default:
        return Routes.getCityScreen();
    }
  }
}

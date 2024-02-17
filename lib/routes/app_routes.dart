abstract class RoutesName {
  static const spalshScreen = '/';
  static const dashBoardScreen = '/dash-board-screen';
  static const homeScreen = '/home-screen';
  static const profileScreen = '/profile-screen';
  static const baseLoginScreen = '/base-login-screen';
  static const editProfileScreen = '/edit-profile-screen';
  static const signUpScreen = '/sign-up-screen';
  static const signInScreen = '/sign-in-screen';
  static const firstsScreen = '/firsts-screen';
  static const exerciseSubjectScreen = '/exercise-subject-screen';
  static const contactScreen = '/contact-screen';
  static const notificationDetails = '/notification-details';
  static const semesterScreen = '/semester-screen';
}

abstract class Routes {
  static String getSpalshScreen() => RoutesName.spalshScreen;
  static String getHomeScreen() => RoutesName.homeScreen;
  static String getProfileScreen() => RoutesName.profileScreen;
  static String getEditProfileScreen() => RoutesName.editProfileScreen;
  static String getBaseLoginScreen() => RoutesName.baseLoginScreen;
  static String getSignInScreen() => RoutesName.signInScreen;
  static String getExerciseSubjectScreen() => RoutesName.exerciseSubjectScreen;
  static String getSignUpScreen() => RoutesName.signUpScreen;
  static String getFirstsScreen() => RoutesName.firstsScreen;
  static String getContactScreen() => RoutesName.contactScreen;
  static String getNotificationDetails() => RoutesName.notificationDetails;
  static String getDashBoardScreen() => RoutesName.dashBoardScreen;
  static String getSemesterScreen() => RoutesName.semesterScreen;
}

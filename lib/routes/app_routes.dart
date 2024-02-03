abstract class RoutesName {
  static const spalshScreen = '/';
  static const dashBoardScreen = '/dash-board-screen';
  static const homeScreen = '/home-screen';
  static const profileScreen = '/profile-screen';
  static const firstsScreen = '/firsts-screen';
  static const resultScreen = '/result-screen';
}

abstract class Routes {
  static String getSpalshScreen() => RoutesName.spalshScreen;
  static String getHomeScreen() => RoutesName.homeScreen;
  static String getProfileScreen() => RoutesName.profileScreen;
  static String getFirstsScreen() => RoutesName.firstsScreen;
  static String getResultScreen() => RoutesName.resultScreen;
  static String getDashBoardScreen() => RoutesName.dashBoardScreen;
}

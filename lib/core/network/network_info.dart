import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfo  {
  static final InternetConnectionChecker connectionChecker = InternetConnectionChecker();

  Future<bool> get isConnected => connectionChecker.hasConnection;
}
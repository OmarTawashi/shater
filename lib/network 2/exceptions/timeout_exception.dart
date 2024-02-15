import 'package:shater/network%202/exceptions/base_exception.dart';


class TimeoutException extends BaseException {
  TimeoutException(String message) : super(message: message);
}

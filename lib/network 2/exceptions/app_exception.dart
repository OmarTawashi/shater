
import 'package:shater/network%202/exceptions/base_exception.dart';

class AppException extends BaseException {
  AppException({
    String message = "",
  }) : super(message: message);
}

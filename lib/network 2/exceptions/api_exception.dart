import 'package:shater/network%202/exceptions/base_api_exception.dart';


class ApiException extends BaseApiException {
  ApiException({
    required int httpCode,
    required String status,
    String message = "",
  }) : super(httpCode: httpCode, status: status, message: message);
}

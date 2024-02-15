import 'dart:io';

import 'package:shater/network%202/exceptions/api_exception.dart';


class NotFoundException extends ApiException {
  NotFoundException(String message, String status)
      : super(httpCode: HttpStatus.notFound, status: status, message: message);
}

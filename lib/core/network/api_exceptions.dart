import 'package:dio/dio.dart';

enum ApiExceptions {
  serverError,
  noInternetConnection,
  serverNotResponding,
}

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final Response? response;
  final ApiExceptions? type;

  ApiException({
    required this.message,
    this.response,
    this.statusCode,
    this.type,
  });

  @override
  toString() {
    String result = '';
    if (response != null) {
      try {
        // api error msg
        result += response!.data['msg'] ??
            (response!.data['errors'] as Map<String, dynamic>)
                .values
                .first[0]
                .toString();
      } catch (_) {}
    } else {
      // dio error msg
      result += ' $message';
    }

    return result;
  }
}

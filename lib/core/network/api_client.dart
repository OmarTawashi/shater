// import 'dart:async';
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shater/config/api_constant.dart';
import 'package:shater/core/network/error_response.dart' as errorRes;

import 'api_exceptions.dart';
import 'api_response.dart';
import 'decodable.dart';
import 'network_info.dart';

enum RequestType {
  get,
  post,
  put,
  delete,
}

class ApiClient {
  static final BaseOptions _options = BaseOptions(
    // baseUrl: ApiConfig.baseUrl,
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      "device-type": "ios",
      "site_country": "",
      "Accept-Language": "ar"
      // 'Authorization':
      //     SharedPrefs.user == null ? '' : 'Bearer ${SharedPrefs.user?.token}'

      // 'X-Client-Device-Name': DeviceInfo.deviceName,
      // 'X-Client-Device-Type': DeviceInfo.manufacturerName,
      // 'X-Client-Platform-Name': DeviceInfo.systemName,
      // 'X-Client-Platform-Version': DeviceInfo.systemVersion,
    },
    receiveTimeout: const Duration(milliseconds: 60 * 1000), // 1 minute
  );

  // static void updateHeader() {
  //   _options.headers['Authorization'] = 'Bearer ${SharedPrefs.user?.token}';
  // }

  static final Dio _dio = Dio(_options)
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

  static _handleDioError({
    required DioError error,
    Function(ApiException)? onError,
  }) async {
    final _response = error.response;

    var exception;

    if (_response?.statusCode != 200 &&
        _response?.data != null &&
        _response?.data is! String) {
      if ((_response?.data.toString() ?? '').startsWith('{errors: [{code:')) {
        errorRes.ErrorResponse _errorResponse =
            errorRes.ErrorResponse.fromJson(_response?.data);
        exception = ApiException(
          statusCode: _response?.statusCode,
          response: _response,
          message: _errorResponse.errors[0].message ?? '',
        );
      } else if ((_response?.data.toString() ?? '').startsWith('{message')) {
        exception = ApiException(
          statusCode: _response?.statusCode,
          response: _response,
          message: _response?.data['message'] ?? '',
        );
      }
    } else if (_response?.statusCode != 200 && _response?.data == null) {
      exception = ApiException(
        statusCode: _response?.statusCode,
        response: _response,
        message: _response?.data['message'] ?? '',
      );
    }

    if (error.response?.statusCode == 500) {
      var exception = ApiException(
        message: 'Server Error',
        statusCode: 500,
      );

      if (onError != null) {
        return onError(exception);
      } else {
        return _handleError(
          'Server Error',
        );
      }
    }

    // if (error.response?.statusCode == 403) {
    //   exception = ApiException(
    //     message: _response?.data['message'] ?? '',
    //     statusCode: 403,
    //   );
    // }

    // if (error.response?.statusCode == 401) {
    //   SharedPrefs.removeUser();
    //   // Get.find<AuthController>().stopLocationRecord();
    //   Get.offAllNamed(Routes.getSignInScreen());

    // }

    // var exception = ApiException(
    //   message: error.message ?? '',
    //   response: error.response,
    //   statusCode: error.response?.statusCode,
    // );

    if (onError != null) {
      return onError(exception);
    } else {
      return _handleError(exception.message);
    }
  }

  static _handleError(String msg) {
    // Fluttertoast.showToast(
    //   msg: msg,
    //   backgroundColor: Colors.red[500],
    //   textColor: Colors.white,
    // );
  }

  static requestData<T extends Decodable>({
    required String endpoint,
    required RequestType requestType,
    required Create<T> create,
    Function(ResponseWrapper<T> response)? onSuccess,
    Function(Map<String, dynamic>)? onSuccessJson,
    Function(dynamic)? onSuccessdynamic,
    Function(int total, int progress)? onSendProgress,
    Function(ApiException)? onError,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    dynamic data,
  }) async {
    bool result = await NetworkInfo().isConnected;
    if (!result) {
      onError!(
        ApiException(
          message: 'no_internet_connection',
          type: ApiExceptions.noInternetConnection,
        ),
      );
    } else {
      try {
        late dio.Response response;
        if (requestType == RequestType.get) {
          response = await _dio.get(
            '${ApiConstant.baseUrl}$endpoint',
            queryParameters: queryParams,
            options: Options(headers: headers),
          );
        } else if (requestType == RequestType.post) {
          response = await _dio.post(
            '${ApiConstant.baseUrl}$endpoint',
            data: data,
            queryParameters: queryParams,
            onSendProgress: onSendProgress,
            options: Options(headers: headers),
          );
        } else if (requestType == RequestType.put) {
          response = await _dio.put(
            '${ApiConstant.baseUrl}$endpoint',
            data: data,
            queryParameters: queryParams,
            onSendProgress: onSendProgress,
            options: Options(headers: headers),
          );
        } else {
          response = await _dio.delete(
            '${ApiConstant.baseUrl}$endpoint',
            queryParameters: queryParams,
            options: Options(headers: headers),
          );
        }
        try {
          if (onSuccess != null) {
            ResponseWrapper<T> responseeWrapper =
                ResponseWrapper.init(create: create, data: response.data);
            responseeWrapper.response = response;
            await onSuccess(responseeWrapper);
          }
          if (onSuccessJson != null) {
            onSuccessJson(response.data);
          }
          if (onSuccessdynamic != null) {
            onSuccessdynamic(response.data);
          }
        } on DioError catch (err) {
          throw ErrorResponse(message: err.message);
        }
      } on DioError catch (error) {
        // final data = ResponseWrapper.init(create: create, data: error.response?.data);
        _handleDioError(error: error, onError: onError);
      } on TimeoutException {
        onError!(
          ApiException(
            message: 'no_internet_connection',
            type: ApiExceptions.noInternetConnection,
          ),
        );
      } on SocketException {
        onError!(
          ApiException(
            message: 'no_internet_connection',
            type: ApiExceptions.noInternetConnection,
          ),
        );
      }
    }
  }
}

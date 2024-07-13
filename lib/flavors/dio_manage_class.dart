// ignore_for_file: avoid_print

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'dart:async';

import '../util/api_constant.dart';


class DioManagerClass {
  DioManagerClass._();

  static final DioManagerClass getInstance = DioManagerClass._();

  late Dio? _dio;

  Dio init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl2,
        receiveDataWhenStatusError: true,
      ),
    );
    _dio?.interceptors.add(ApiInterceptors());
    return _dio!;
  }

  Future<Response> dioGetMethod(
      {var url, Map<String, dynamic>? header, var queryParameters}) async {
    print("msg_sendde_url $url");
    print("msg_sendde_header $header");
    print("msg_sendde_QP ${queryParameters.toString()}");
    var containsTestKey = Platform.environment.containsKey('FLUTTER_TEST');
    if (containsTestKey) {
      return await _dio!.get(url,
          options: Options(headers: header), queryParameters: queryParameters);
    } else {
      if (await checkInternetConnectivity()) {
        return await _dio!.get(url,
            options: Options(headers: header),
            queryParameters: queryParameters);
      } else {
        // snackError(AppStrings.txtNoConnection.tr.toString());
        throw SocketException('No Connection');
      }
    }
  }

  Future<Response> dioPostMethod({
    var url,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
  }) async {
    print("msg_sendde_url $url");
    print("msg_sendde_header $header");
    var containsTestKey = Platform.environment.containsKey('FLUTTER_TEST');
    if (containsTestKey) {
      return await _dio!.post(
        url,
        options: Options(headers: header),
        data: body,
      );
    } else {
      if (await checkInternetConnectivity()) {
        return await _dio!.post(
          url,
          options: Options(headers: header),
          data: body,
        );
      } else {
        // snackError(AppStrings.txtNoConnection.tr.toString());
        throw SocketException('No Connection');      }
    }
  }

  Future<Response> dioPostFormMethod(
      {var url, Map<String, dynamic>? header, var body}) async {
    print("msg_request_url : $url");
    print("msg_request_header : $header");
    print("msg_request_body : $body");
    var containsTestKey = Platform.environment.containsKey('FLUTTER_TEST');
    if (containsTestKey) {
      return await _dio!.post(
        url,
        options: Options(headers: header),
        data: FormData.fromMap(body),
      );
    } else {
      if (await checkInternetConnectivity()) {
        return await _dio!.post(
          url,
          options: Options(headers: header),
          data: FormData.fromMap(body),
        );
      } else {
        // snackError(AppStrings.txtNoConnection.tr.toString());
        throw SocketException('No Connection');      }
    }
  }

  Future<Response> dioFileDownload(
      {var url,
        var path,
      Map<String, dynamic>? header}) async {
    return _dio!.download(
      url,
      path,
      options: Options(
          headers: header,
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
  }

  //review
  Future<Response> dioMultiPartPostMethod(
      {var url,
      Map<String, dynamic>? header,
      String? keyName,
      var body,
      required File file}) async {
    log("msg_request_url : $url");
    log("msg_request_header : $header");
    log("msg_request_body : $body");
    // String fileName = file.path.split('/').last;

    // FormData formData = FormData.fromMap({
    //   keyName ?? 'file':
    //       /*await*/ MultipartFile.fromFileSync(file.path, /*filename: fileName*/),
    // });
    var containsTestKey = Platform.environment.containsKey('FLUTTER_TEST');
    if (containsTestKey) {
      return await _dio!.post(
        url,
        options: Options(headers: header),
        data: FormData.fromMap({
          keyName ?? 'file':
          /*await*/ MultipartFile.fromFileSync(file.path, /*filename: fileName*/),
        }),
      );
    } else {
      if (await checkInternetConnectivity()) {
        return await _dio!.post(
          url,
          options: Options(headers: header),
          // data: formData,
          data: FormData.fromMap({
            keyName ?? 'file':
            /*await*/ MultipartFile.fromFileSync(file.path, /*filename: fileName*/),
          }),
        );
      } else {
        // snackError(AppStrings.txtNoConnection.tr.toString());
        throw SocketException('No Connection');
      }
    }
  }

  Future<Response> dioUpdateMethod(
      {var url,
      Map<String, dynamic>? header,
      Map<String, dynamic>? body}) async {
    var containsTestKey = Platform.environment.containsKey('FLUTTER_TEST');
    if (containsTestKey) {
      return await _dio!
          .put(url, options: Options(headers: header), data: body);
    } else {
      if (await checkInternetConnectivity()) {
        return await _dio!
            .put(url, options: Options(headers: header), data: body);
      } else {
        // snackError(AppStrings.txtNoConnection.tr.toString());
        throw SocketException('No Connection');      }
    }
  }

  Future<Response> dioPatchMethod(
      {var url,
      Map<String, dynamic>? header,
      Map<String, dynamic>? body}) async {
    var containsTestKey = Platform.environment.containsKey('FLUTTER_TEST');
    if (containsTestKey) {
      return await _dio!
          .patch(url, options: Options(headers: header), data: body);
    } else {
      if (await checkInternetConnectivity()) {
        return await _dio!
            .patch(url, options: Options(headers: header), data: body);
      } else {
        // snackError(AppStrings.txtNoConnection.tr.toString());
        throw SocketException('No Connection');      }
    }
  }

  Future<Response> dioDeleteMethod(
      {var url,
      Map<String, dynamic>? header,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body}) async {
    var containsTestKey = Platform.environment.containsKey('FLUTTER_TEST');
    if (containsTestKey) {
      return await _dio!.delete(url,
          options: Options(headers: header),
          data: body,
          queryParameters: queryParameters);
    } else {
      if (await checkInternetConnectivity()) {
        return await _dio!.delete(url,
            options: Options(headers: header),
            data: body,
            queryParameters: queryParameters);
      } else {
        // snackError(AppStrings.txtNoConnection.tr.toString());
        throw SocketException('No Connection');
      }
    }
  }

  Future<bool> checkInternetConnectivity() async {
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // return connectivityResult == ConnectivityResult.mobile ||
    //     connectivityResult == ConnectivityResult.wifi;
    return await true;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    // log(
    //     "onRequest : ${options.path} \n ${options.queryParameters} \n ${options.method} \n ${options.data}");
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
   log("onResponse : ${response.statusCode}");
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    log("onError : ${err.message}");
  }
}

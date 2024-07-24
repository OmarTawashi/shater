import 'dart:developer';

import 'package:dio/dio.dart';

import '../../data/model/error_model.dart';
import 'decodable.dart';

///A function that creates an object of type [T]

typedef Create<T> = T Function();

///Construct to get object from generic class

abstract class GenericObject<T> {
  Create<Decodable> create;

  GenericObject({required this.create});

  T genericObject(dynamic data) {
    final item = create();
    return item.decode(data);
  }
}

///Construct to wrap response from API.
///
///Used it as return object of APIController to handle any kind of response.

class ResponseWrapper<T> extends GenericObject<T> {
  T? data;
  Response? response;

  ResponseWrapper({required Create<Decodable> create, this.response})
      : super(create: create);

  factory ResponseWrapper.init(
      {required Create<Decodable> create,
      required dynamic data,
      Response? response}) {
    final wrapper = ResponseWrapper<T>(create: create);
    wrapper.data = wrapper.genericObject(data);
    // wrapper.response = response;
    return wrapper;
  }
}

class APIResponse<T> extends GenericObject<T>
    implements Decodable<APIResponse<T>> {
  String? error;
  bool? status;
  String? message;
  List<T>? items;
  List<T>? data;
  T? item;
  List<ErrorModel>? errors;

  APIResponse({required Create<Decodable> create}) : super(create: create);

  @override
  APIResponse<T> decode(dynamic json) {
    error = json['error'];
    status = json['status'];
    message = json['message'];
    items = [];
    data = [];

    try {
      if (json.containsKey("items")) {
        json['items'].forEach((item) {
          items?.add(genericObject(item));
        });
      } else {
        log("json['data'] : ${json['data']}");
        json['data'].forEach((item) {
          log("item : ${item.toString()}");
          items?.add(genericObject(item));
        });
      }
    } catch (error) {
      log("☢️☢️☢️ Items typemismatch error ignored $error");
    }

    try {
      if (json is Map<String, dynamic> && json.containsKey("items")) {
        item = genericObject(json["items"]);
      } else if (json is Map<String, dynamic>) {
        item = genericObject(json);
      } else {
        item = genericObject(json);
      }
    } catch (error) {
      log("☢️☢️☢️ Item typemismatch error ignored $error");
    }

    try {
      errors = [];
      if (json['errors'] != null) {
        json['errors'].forEach((e) => errors?.add(ErrorModel.fromJson(e)));
      }
    } catch (error) {
      log("☢️☢️☢️ Errors typemismatch error ignored $error");
    }

    return this;
  }
}

class ErrorResponse implements Exception {
  String? message;

  ErrorResponse({this.message});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(message: json['message'] ?? 'Something went wrong.');
  }

  @override
  String toString() {
    return message ?? 'Failed to convert message to string.';
  }
}

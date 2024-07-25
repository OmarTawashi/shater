import 'package:shater/core/network/decodable.dart';

class ResponseModel extends Decodable<ResponseModel> {
  bool? status;
  String? message;
  dynamic errorsObject;

  ResponseModel({this.status, this.message, this.errorsObject});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errorsObject = json['errors_object'];
  }

  @override
  ResponseModel decode(json) {
    status = json['status'];
    message = json['message'];
    errorsObject = json['errors_object'];

    return this;
  }
}

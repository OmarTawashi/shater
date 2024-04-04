class ErrorModel {
  String? code;
  String? message;

  ErrorModel({this.code, this.message});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    code = json['fieldname'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fieldname'] = code;
    data['message'] = message;
    return data;
  }
}
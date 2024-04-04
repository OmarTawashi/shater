import 'package:shater/core/network/decodable.dart';

class NotificationModel extends Decodable<NotificationModel> {
  String? id;
  NotificationDetails? data;
  String? createdAt;
  String? readAt;

  NotificationModel({this.id, this.data, this.createdAt, this.readAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'] != null ? new NotificationDetails.fromJson(json['data']) : null;
    createdAt = json['created_at'];
    readAt = json['read_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    data['created_at'] = this.createdAt;
    data['read_at'] = this.readAt;
    return data;
  }

  @override
  NotificationModel decode(json) {
    id = json['id'];
    data = json['data'] != null
        ? new NotificationDetails.fromJson(json['data'])
        : null;
    createdAt = json['created_at'];
    readAt = json['read_at'];
    return this;
  }
}

class NotificationDetails {
  String? title;
  String? message;
  String? type;
  int? id;
  String? sToken;
  String? list;
  String? titleAr;
  String? contentAr;

  NotificationDetails(
      {this.title,
      this.message,
      this.type,
      this.id,
      this.sToken,
      this.list,
      this.titleAr,
      this.contentAr});

  NotificationDetails.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    type = json['type'];
    id = json['id'];
    sToken = json['_token'];
    list = json['list'];
    titleAr = json['title_ar'];
    contentAr = json['content_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['message'] = this.message;
    data['type'] = this.type;
    data['id'] = this.id;
    data['_token'] = this.sToken;
    data['list'] = this.list;
    data['title_ar'] = this.titleAr;
    data['content_ar'] = this.contentAr;
    return data;
  }
}

import 'package:shater/core/network/decodable.dart';

class MessgaesResponseModel extends Decodable<MessgaesResponseModel> {
  int? id;
  String? details;
  List<ReplayMessage>? replies;
  String? createdAt;
  int? readAt;

  MessgaesResponseModel(
      {this.id, this.details, this.replies, this.createdAt, this.readAt});

  MessgaesResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    details = json['details'];
    if (json['replies'] != null) {
      replies = <ReplayMessage>[];
      json['replies'].forEach((v) {
        replies!.add(new ReplayMessage.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    readAt = json['read_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['details'] = this.details;
    if (this.replies != null) {
      data['replies'] = this.replies!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['read_at'] = this.readAt;
    return data;
  }

  @override
  MessgaesResponseModel decode(json) {
    id = json['id'];
    details = json['details'];
    if (json['replies'] != null) {
      replies = <ReplayMessage>[];
      json['replies'].forEach((v) {
        replies!.add(new ReplayMessage.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    readAt = json['read_at'];
    return this;
  }
}

class ReplayMessage {
  int? id;
  int? contactId;
  String? text;
  int? userId;
  String? userType;
  String? createdAt;
  String? updatedAt;

  ReplayMessage(
      {this.id,
      this.contactId,
      this.text,
      this.userId,
      this.userType,
      this.createdAt,
      this.updatedAt});

  ReplayMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contactId = json['contact_id'];
    text = json['text'];
    userId = json['user_id'];
    userType = json['user_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contact_id'] = this.contactId;
    data['text'] = this.text;
    data['user_id'] = this.userId;
    data['user_type'] = this.userType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

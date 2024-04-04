import 'package:shater/core/network/decodable.dart';

class ContactStoreModel extends Decodable<ContactStoreModel>{
  int? userId;
  String? details;
  int? id;

  ContactStoreModel({this.userId, this.details, this.id});

  ContactStoreModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    details = json['details'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['details'] = this.details;
    data['id'] = this.id;
    return data;
  }
  
  @override
  ContactStoreModel decode(json) {
    userId = json['user_id'];
    details = json['details'];
    id = json['id'];
    return this;
  }
}

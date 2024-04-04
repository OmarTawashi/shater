import 'package:shater/core/network/decodable.dart';

class PublicModel extends Decodable<PublicModel> {
  int? id;
  String? name;
  String? title;

  PublicModel({
    this.id,
    this.name,
    this.title,
  });

  PublicModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;

    return data;
  }

  @override
  PublicModel decode(json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    return this;
  }
}
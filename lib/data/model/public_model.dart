import 'package:shater/core/network/decodable.dart';

class PublicModel extends Decodable<PublicModel> {
  int? id;
  String? name;

  PublicModel({
    this.id,
    this.name,
  });

  PublicModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;

    return data;
  }

  @override
  PublicModel decode(json) {
    id = json['id'];
    name = json['name'];
    return this;
  }
}
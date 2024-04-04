import 'package:shater/core/network/decodable.dart';

class School extends Decodable<School> {
  int? id;
  String? name;
  int? isSpecial;

  School({
    this.id,
    this.name,
    this.isSpecial,
  });

  School.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isSpecial = json['is_special'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_special'] = this.isSpecial;

    return data;
  }

  @override
  School decode(json) {
    id = json['id'];
    name = json['name'];
    isSpecial = json['is_special'];

    return this;
  }
}

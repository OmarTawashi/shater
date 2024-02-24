import 'package:shater/core/network/decodable.dart';

class Country extends Decodable<Country> {
  String? id;
  String? title;
  String? image;
  int? isSelected;

  Country({this.id, this.title, this.image, this.isSelected});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    isSelected = json['is_selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['is_selected'] = this.isSelected;
    return data;
  }

  @override
  Country decode(json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    isSelected = json['is_selected'];
    return this;
  }
}

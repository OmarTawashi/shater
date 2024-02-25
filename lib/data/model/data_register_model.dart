import 'package:shater/core/network/decodable.dart';
import 'package:shater/data/model/class_model.dart';
import 'package:shater/data/model/public_model.dart';

class DataRegisterModel extends Decodable<DataRegisterModel> {
  List<Country>? country;
  List<PublicModel>? level;

  DataRegisterModel({this.country, this.level});

  DataRegisterModel.fromJson(Map<String, dynamic> json) {
    if (json['country'] != null) {
      country = [];
      json['country'].forEach((v) {
        country?.add(new Country.fromJson(v));
      });
    }
    if (json['level'] != null) {
      level = [];
      json['level'].forEach((v) {
        level?.add(new PublicModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.country != null) {
      data['country'] = this.country?.map((v) => v.toJson()).toList();
    }
    if (this.level != null) {
      data['level'] = this.level?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  DataRegisterModel decode(json) {
    if (json['country'] != null) {
      country = [];
      json['country'].forEach((v) {
        country?.add(new Country.fromJson(v));
      });
    }
    if (json['level'] != null) {
      level = [];
      json['level'].forEach((v) {
        level?.add(new PublicModel.fromJson(v));
      });
    }
    return this;
  }
}

class Country {
  String? id;
  String? title;
  String? image;
  int? isSelected;
  List<Classes>? classes;

  Country({this.id, this.title, this.image, this.isSelected, this.classes});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    isSelected = json['is_selected'];
    if (json['classes'] != null) {
      classes = [];
      json['classes'].forEach((v) {
        classes?.add(new Classes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['is_selected'] = this.isSelected;
    if (this.classes != null) {
      data['classes'] = this.classes?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

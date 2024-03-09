import 'package:shater/core/network/decodable.dart';
import 'package:shater/data/model/student_model.dart';

class SchoolRateModel extends Decodable<SchoolRateModel> {
  School? school;
  int? score;

  SchoolRateModel({this.school, this.score});

  SchoolRateModel.fromJson(Map<String, dynamic> json) {
    school =
        json['school'] != null ? new School.fromJson(json['school']) : null;
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.school != null) {
      data['school'] = this.school?.toJson();
    }
    data['score'] = this.score;
    return data;
  }
  
  @override
  SchoolRateModel decode(json) {
     school =
        json['school'] != null ? new School.fromJson(json['school']) : null;
    score = json['score'];
    return this;
  }
}

class School {
  int? id;
  int? cityId;
  String? name;
  String? type;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  int? isSpecial;
  String? image;
  int? studentsCount;
  int? teachersCount;
  City? city;

  School(
      {this.id,
      this.cityId,
      this.name,
      this.type,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.isSpecial,
      this.image,
      this.studentsCount,
      this.teachersCount,
      this.city});

  School.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['city_id'];
    name = json['name'];
    type = json['type'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isSpecial = json['is_special'];
    image = json['image'];
    studentsCount = json['students_count'];
    teachersCount = json['teachers_count'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city_id'] = this.cityId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_special'] = this.isSpecial;
    data['image'] = this.image;
    data['students_count'] = this.studentsCount;
    data['teachers_count'] = this.teachersCount;
    if (this.city != null) {
      data['city'] = this.city?.toJson();
    }
    return data;
  }
}
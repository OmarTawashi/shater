import 'package:shater/core/network/decodable.dart';
import 'package:shater/data/model/class_model.dart';
import 'package:shater/data/model/school_model.dart';

class StudentModel extends Decodable<StudentModel> {
  Student? student;
  City? city;
  School? school;
  Classes? classes;
  int? score;

  StudentModel(
      {this.student, this.city, this.school, this.classes, this.score});

  StudentModel.fromJson(Map<String, dynamic> json) {
    student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    school =
        json['school'] != null ? new School.fromJson(json['school']) : null;
    classes =
        json['classes'] != null ? new Classes.fromJson(json['classes']) : null;
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.student != null) {
      data['student'] = this.student?.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city?.toJson();
    }
    if (this.school != null) {
      data['school'] = this.school?.toJson();
    }
    if (this.classes != null) {
      data['classes'] = this.classes?.toJson();
    }
    data['score'] = this.score;
    return data;
  }
  
  @override
  StudentModel decode(json) {
   student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    school =
        json['school'] != null ? new School.fromJson(json['school']) : null;
    classes =
        json['classes'] != null ? new Classes.fromJson(json['classes']) : null;
    score = json['score'];
    return this;
  }
}

class Student {
  int? id;
  String? name;
  String? image;

  Student({this.id, this.name, this.image});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class City {
  int? id;
  int? countryId;
  String? name;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  City(
      {this.id,
      this.countryId,
      this.name,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    name = json['name'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_id'] = this.countryId;
    data['name'] = this.name;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
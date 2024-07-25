import 'package:shater/core/network/decodable.dart';

class Classes  extends Decodable<Classes> {
  String? id;
  String? title;
  int? countryId;
  int? levelId;
  String? updatedAt;
  int? isActive;
  String? redirectTo;

  Classes(
      {this.id,
      this.title,
      this.countryId,
      this.levelId,
      this.updatedAt,
      this.isActive,
      this.redirectTo});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    countryId = json['country_id'];
    levelId = json['level_id'];
    updatedAt = json['updated_at'];
    isActive = json['is_active'];
    redirectTo = json['redirect_to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['country_id'] = this.countryId;
    data['level_id'] = this.levelId;
    data['updated_at'] = this.updatedAt;
    data['is_active'] = this.isActive;
    data['redirect_to'] = this.redirectTo;
    return data;
  }
  
  @override
  Classes decode(json) {
     id = json['id'];
    title = json['title'];
    countryId = json['country_id'];
    levelId = json['level_id'];
    updatedAt = json['updated_at'];
    isActive = json['is_active'];
    redirectTo = json['redirect_to'];
    return this;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Classes && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  int compareTo(Classes other) {
    // TODO: implement compareTo
    return other.id!.compareTo(id!);
  }
}
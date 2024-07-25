import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shater/core/network/decodable.dart';

class QualificationResponse extends Decodable<QualificationResponse> {
  int? id;
  QualificationUser? user;
  String? title;
  var file;
  var fileMap;
  int? type;
  TextEditingController textEditingController = TextEditingController();

  QualificationResponse({this.id, this.user ,this.title, this.file, this.type});

  // QualificationResponse.fromJson(Map<String, dynamic> json) {
  //   try {
  //     id = json['id'];
  //     user = json['user'] != null
  //         ? QualificationUser.fromJson(json['user'])
  //         : null;
  //     title = json['title'];
  //     if(!json['file'].isMap){
  //       file = json['file'];
  //     }
  //     type = json['type'];
  //   } on Exception catch (e) {
  //     log("QualificationResponse.fromJson e : $e");
  //   }
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['title'] = this.title;
    data['file'] = this.file;
    data['type'] = this.type;
    return data;
  }

  @override
  QualificationResponse decode(dynamic json) {
    try {
      id = json['id'];
      user = json['user'] != null
          ? QualificationUser.fromJson(json['user'])
          : null;
      title = json['title'];
      file =  json['file'];
      type = json['type'];
      textEditingController.text = title ?? '';
    } on Exception catch (e) {
      log("QualificationResponse.fromJson e : $e");
    }

    return this;
  }
}

class QualificationUser extends Decodable<QualificationUser> {
  int? user;
  String? name;

  QualificationUser({this.user, this.name});

  QualificationUser.fromJson(Map<String, dynamic> json) {
    try {
      user = json['user'];
      name = json['name'];
    } on Exception catch (e) {
      log("QualificationResponse.fromJson e : $e");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['name'] = this.name;
    return data;
  }

  @override
  QualificationUser decode(dynamic json) {
    try {
      user = json['user'];
      log("user : $user");
      name = json['name'];
      log("name : $user");
    } on Exception catch (e) {
      log("QualificationUser.fromJson e : $e");
    }

    return this;
  }
}

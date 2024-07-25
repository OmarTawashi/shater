import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QualificationsModel{
  File? file;
  String? name;
  TextEditingController textEditingController = TextEditingController();

  QualificationsModel({
    required this.file,
    required this.name,
}){

  }

  setEditingController(String value){
    textEditingController.text = value;
  }

  Map<String,dynamic> getData(int type){
    Map<String,dynamic> data = {
      'type' : type,
      'title' : textEditingController.text.trim(),
    };
    return data;
  }

}
import 'package:get/get.dart';

class TakeImageController extends GetxController{

  String? _typeAvatar;
  String? get typeAvatar =>_typeAvatar;


  void setTypeAvatar(String type){
    _typeAvatar = type;
    update();
  }

}
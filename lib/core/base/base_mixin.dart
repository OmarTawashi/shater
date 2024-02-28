import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

mixin BaseMixin {
  static void showToastFlutter({String? messsage}) {
    Fluttertoast.showToast(
      msg: (messsage ?? '').tr,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 1,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.amberAccent,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

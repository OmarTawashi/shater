import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shater/util/color.dart';

import '../../presentation/screens/auth/sign in/widgets/childern_widget.dart';

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
   static showCustomBottomSheet(Widget child, {double? heightFactor}) =>
      Get.bottomSheet(
        child,
        backgroundColor: COLORS.secanderyColor,
        enableDrag: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
      );

  static void bottomSheetChildern() {
    Get.bottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: COLORS.primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      ChildrenWidget(),
    );
  }
}

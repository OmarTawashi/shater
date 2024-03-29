import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

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
  static showBottomSheet(Widget child, {double? heightFactor}) =>
      Get.bottomSheet(
        child,
        enableDrag: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            topLeft: Radius.circular(8),
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

  static void showDialogCloseQuestion(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: CustomText(
            text: 'do_you_want_to_get_out_of_exercise',
            fontSize: Dimensions.fontSize14,
            color: Color.fromRGBO(75, 75, 75, 1),
            textAlign: TextAlign.center,
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CustomText(
              text: 'your_progress_for_this_exercise_will_not_be_saved',
              fontSize: Dimensions.fontSize12,
              textAlign: TextAlign.center,
              color: Color.fromRGBO(118, 118, 118, 1),
              maxLine: 1,
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Get.back();
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomText(
                  text: 'exit',
                  fontSize: Dimensions.fontSize16,
                  color: Colors.red,
                  textAlign: TextAlign.center,
                  maxLine: 1,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomText(
                  text: 'continue_study',
                  fontSize: Dimensions.fontSize16,
                  textAlign: TextAlign.center,
                  color: Colors.blue,
                  maxLine: 1,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

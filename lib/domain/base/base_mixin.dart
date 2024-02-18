import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

mixin BaseMixin {
  static void showToastFlutter( {String? messsage}) {
    Fluttertoast.showToast(
        msg: (messsage ?? '').tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    // FToast? fToast;

    // fToast = FToast();
    // fToast.init(Get.context!);
    // fToast.showToast(
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    //     decoration: BoxDecoration(
    //         border: Border.all(color: const Color.fromRGBO(247, 185, 185, 1)),
    //         color: const Color.fromRGBO(250, 229, 228, 1),
    //         borderRadius: BorderRadius.circular(8)),
    //     child: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Image.asset(
    //           IMAGES.logoApp,
    //           width: 35,
    //           height: 35,
    //           color: const Color.fromRGBO(190, 74, 69, 1),
    //         ),
    //         const SizedBox(
    //           width: Dimensions.paddingSize16,
    //         ),
    //         Flexible(
    //           child: Text(
    //             messsage ?? '',
    //             style: FontStyleConstant.hNLTRegular.copyWith(
    //                 color: const Color.fromRGBO(190, 74, 69, 1),
    //                 fontSize: Dimensions.fontSize12),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    //   gravity: ToastGravity.TOP,
    //   toastDuration: const Duration(seconds: 3),
    // );
  }
}
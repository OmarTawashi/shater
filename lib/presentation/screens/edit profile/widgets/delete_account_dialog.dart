
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../util/color.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/font_style.dart';
import '../../base/custom_text_form_field.dart';
import '../../base/text_custom.dart';

class DeleteAccountDialog extends StatefulWidget {
  BuildContext context;
  Function onConfirm;
  TextEditingController textEditingController;
  bool isEnable = false;

  DeleteAccountDialog(
      {required this.context,
        required this.onConfirm,
        required this.textEditingController,});

  @override
  State<DeleteAccountDialog> createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<DeleteAccountDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      color: Colors.transparent,
      child: CupertinoAlertDialog(
        title: CustomText(
          text: 'delete_my_account'.tr,
          fontSize: Dimensions.fontSize14,
          color: Color.fromRGBO(75, 75, 75, 1),
          textAlign: TextAlign.center,
        ),
        content: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: 'do_you_want_delete_account'.tr,
                fontSize: Dimensions.fontSize12,
                textAlign: TextAlign.center,
                color: Color.fromRGBO(118, 118, 118, 1),
                maxLine: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 35.h,
                alignment: Alignment.center,
                width: double.infinity,
                child: CustomTextFormField(
                  controller: widget.textEditingController,
                  textAlign: TextAlign.start,
                  borderRadius: 10.r,
                  fillColor: Colors.white,
                  borderColor: Colors.transparent,
                  hintText: 'enter_delete_my_account'.tr,
                  style: FontStyleConstant.hNLTRegular.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: Dimensions.fontSize13,
                  ),
                  hintStyle: FontStyleConstant.hNLTRegular.copyWith(
                    color: Colors.grey.withOpacity(0.6),
                    fontWeight: FontWeight.normal,
                    fontSize: Dimensions.fontSize12,
                  ),
                  textColor: COLORS.primaryColor,
                  textSize: Dimensions.fontSize17,
                  cursorColor: COLORS.primaryColor,
                  onChanged: (value){
                    // Get.find<EditProfileController>().isDeleteAccountEnable();
                    setState(() {
                      widget.isEnable = ('delete_my_account'.tr) == widget.textEditingController.text;
                    });
                  },
                ),
              )
            ],
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomText(
                text: 'exit',
                fontSize: Dimensions.fontSize14,
                color: Colors.red,
                textAlign: TextAlign.center,
                maxLine: 1,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if(widget.isEnable){
                widget.onConfirm();
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomText(
                text: 'delete_my_account'.tr,
                fontSize: Dimensions.fontSize14,
                textAlign: TextAlign.center,
                color: widget.isEnable ? Colors.blue : Colors.grey,
                maxLine: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
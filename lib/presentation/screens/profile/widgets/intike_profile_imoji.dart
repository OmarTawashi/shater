import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/dimensions.dart';
import '../../../widgets/custom_network_image.dart';
import '../../base/image_user.dart';
import '../../base/text_custom.dart';

class IntikeProfileImoji extends StatelessWidget {
  final String? asset;
  final String? imageUrl;
  final String? text;
  final Function()? onTap;
  final bool isEnable;

  const IntikeProfileImoji({
    super.key,
    this.asset,
    this.text,
    this.onTap,
    this.isEnable = false,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                height: isEnable ? 65.h : 60.h,
                width: isEnable ? 65.w : 60.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(72, 131, 196, 1), shape: BoxShape.circle),
                child: ImageUser(
                        imageUrl: imageUrl,
                        height: isEnable ? 70.h : 50.h,
                        width: isEnable ? 70.w : 50.w,
                      ),
              ),
              !isEnable ? Container(
                height: isEnable ? 65.h : 60.h,
                width: isEnable ? 65.w : 60.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5), shape: BoxShape.circle),
              ) : SizedBox.shrink(),

            ],
          ),
          SizedBox(
            height: Dimensions.paddingSize10,
          ),
          SizedBox(
            width: isEnable ? 65.w : 60.w,
            child: CustomText(
              text: text ?? '',
              textAlign: TextAlign.center,
              maxLine: 2,
              overFlow: TextOverflow.ellipsis,
              color: isEnable ? Colors.white : Color.fromRGBO(159, 191, 216, 1),
              fontSize: isEnable ? Dimensions.fontSize12 : Dimensions.fontSize10,
            ),
          )
        ],
      ),
    );
  }
}

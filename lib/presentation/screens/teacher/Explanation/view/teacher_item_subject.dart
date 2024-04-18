import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/data/model/class_model.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';

import '../../../../../util/color.dart';
import '../../../../../util/dimensions.dart';
import '../../../base/text_custom.dart';

class TeacherItemSubject extends StatelessWidget {
  final Function()? onTap;
  final String? textSubject;
  final String? imageUrl;
  final Classes? classes;
  final int? teacherCountVideo;

  const TeacherItemSubject({
    super.key,
    this.onTap,
    this.textSubject,
    this.imageUrl,
    this.classes,
    this.teacherCountVideo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImageWidget(
                    imageUrl: imageUrl ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: Dimensions.paddingSize16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      text: classes?.title ?? "",
                      color: Colors.white,
                      fontSize: Dimensions.fontSize18,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: Dimensions.paddingSize20,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSize12,
                            vertical: Dimensions.paddingSize8),
                        decoration: BoxDecoration(
                            color: COLORS.primaryColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: CustomText(
                          text: '$teacherCountVideo' '\t' + 'درس'.tr,
                          color: COLORS.whiteColor,
                          fontSize: Dimensions.fontSize12,
                          fontWeight: FontWeight.bold,
                        ))
                    ,
                  ],
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: COLORS.primaryColor,
                        size: 16,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: COLORS.primaryColor.withOpacity(0.15),
            height: 18,
            thickness: 1.5,
            endIndent: 80.w,
            indent: 8,
          )
        ],
      ),
    );
  }
}

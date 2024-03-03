import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/routes/app_routes.dart';

import '../../../../../util/color.dart';
import '../../../../../util/dimensions.dart';
import '../../../base/text_custom.dart';

class ItemExercise extends StatelessWidget {
  final String? subjectText;
  final int? trainingNumber;
  final String? imageUrl;
  const ItemExercise({
    super.key,
    this.subjectText,
    this.trainingNumber,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB( 16,10,16,0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 100,
                width: 100,
                clipBehavior: Clip.hardEdge,
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: CachedNetworkImageWidget(
                  imageUrl: imageUrl ?? '',
                  fit: BoxFit.cover,
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
                      text: subjectText ?? '',
                      color: Colors.white,
                      fontSize: Dimensions.fontSize18,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: Dimensions.paddingSize20,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSize12,
                            vertical: Dimensions.paddingSize8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: CustomText(
                          text: '$trainingNumber' '\t' + 'trainning'.tr,
                          color: COLORS.secanderyColor,
                          fontSize: Dimensions.fontSize12,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.getExerciseDetailsScreen());
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: COLORS.primaryColor),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'exercied',
                        color: Colors.white,
                        textAlign: TextAlign.start,
                        fontSize: Dimensions.fontSize13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        width: Dimensions.paddingSize10,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                        size: 16,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
           SizedBox(
            height: 8 ,
          ),
          Divider(
            color: COLORS.primaryColor.withOpacity(0.15),
            height: 10,
            thickness: 1.5,
            endIndent: 80.w,
            indent: 8,
          ),
         
        ],
      ),
    );
  }
}

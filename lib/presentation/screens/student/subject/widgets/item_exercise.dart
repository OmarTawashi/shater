import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';

import '../../../../../util/color.dart';
import '../../../../../util/dimensions.dart';
import '../../../base/text_custom.dart';

class ItemExercise extends StatelessWidget {
  final String? subjectText;
  final int? trainingNumber;
  final String? imageUrl;
  final Function()? onTap;
  const ItemExercise(
      {super.key,
      this.subjectText,
      this.trainingNumber,
      this.imageUrl,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
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
                width: 80,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(8)),
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
                      fontSize: 23,
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
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Color.fromRGBO(72, 131, 196, 1)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.white),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'exercied',
                          color: COLORS.primaryColor,
                          textAlign: TextAlign.start,
                          fontSize: Dimensions.fontSize14,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: Dimensions.paddingSize5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: COLORS.primaryColor,
                          size: 16,
                          weight: 100,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
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

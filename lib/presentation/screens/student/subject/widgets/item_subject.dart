import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';

import '../../../../../util/color.dart';
import '../../../../../util/dimensions.dart';
import '../../../base/text_custom.dart';

class ItemSubject extends StatelessWidget {
  final Function()? onTap;
  final String? textSubject;
  final String? imageUrl;
  final int? pageCount;
  final int? questionCount;
  const ItemSubject({
    super.key,
    this.onTap,
    this.textSubject,
    this.imageUrl,
    this.pageCount,
    this.questionCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
          child: Row(
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
                      text: textSubject ?? "",
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: Dimensions.paddingSize16,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSize12,
                            vertical: Dimensions.paddingSize8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: CustomText(
                          text: '$pageCount' '\t' + 'lessons'.tr,
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
                          text: 'ادرس',
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
        ),
        Divider(
          color: COLORS.primaryColor.withOpacity(0.15),
          height: 35,
          thickness: 1.5,
          endIndent: 80.w,
        )
      ],
    );
  }
}

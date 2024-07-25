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
  final bool has_subscription;

  const ItemSubject({
    super.key,
    this.onTap,
    this.textSubject,
    this.imageUrl,
    this.pageCount,
    this.questionCount,
    required this.has_subscription,
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
                  borderRadius: BorderRadius.circular(8),
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
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),
                    color: Colors.white,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.r),
                        color: COLORS.primaryColor),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          has_subscription
                              ? Icons.lock_open_outlined
                              : Icons.lock_outline_rounded,
                          color: COLORS.whiteColor,
                          size: 23,
                          weight: 100,
                        ),
                        SizedBox(
                          width: Dimensions.paddingSize5,
                        ),
                        CustomText(
                          text: has_subscription ? "ادرس" : "افتح",
                          color: Colors.white,
                          textAlign: TextAlign.start,
                          fontSize: Dimensions.fontSize16,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: Dimensions.paddingSize5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: COLORS.whiteColor,
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

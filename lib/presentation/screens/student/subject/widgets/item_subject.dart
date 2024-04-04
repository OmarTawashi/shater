import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                height: 130,
                width: 100,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                   border: Border.all(
                    color: Colors.white,
                    width: 4
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
                      fontSize: Dimensions.fontSize18,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: Dimensions.paddingSize20,
                    ),
                    CustomText(
                      text: "${pageCount}" + "\t" + 'درس',
                      color: Color.fromRGBO(198, 235, 245, 1),
                      fontSize: Dimensions.fontSize14,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: Dimensions.paddingSize8,
                    ),
                    CustomText(
                      text: "${questionCount}" + "\t" + 'تدريب',
                      color: Color.fromRGBO(198, 235, 245, 1),
                      fontSize: Dimensions.fontSize14,
                      fontWeight: FontWeight.bold,
                    ),
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
                      CustomText(
                        text: 'تعلم',
                        color: COLORS.primaryColor,
                        textAlign: TextAlign.start,
                        fontSize: Dimensions.fontSize14,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: Dimensions.paddingSize10,
                      ),
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

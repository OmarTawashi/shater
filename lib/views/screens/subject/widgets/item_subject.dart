import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/color.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/images.dart';
import '../../base/text_custom.dart';

class ItemSubject extends StatelessWidget {
  const ItemSubject({
    super.key,
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
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Image.asset(
                  ICONS.book,
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
                    const CustomText(
                      text: 'رياضيات',
                      color: Colors.white,
                      fontSize: Dimensions.fontSize18,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: Dimensions.paddingSize12,
                    ),
                    CustomText(
                      text: "110" + "\t" + 'درس',
                      color: Color.fromRGBO(198, 235, 245, 1),
                      fontSize: Dimensions.fontSize14,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: Dimensions.paddingSize8,
                    ),
                    CustomText(
                      text: "110" + "\t" + 'تدريب',
                      color: Color.fromRGBO(198, 235, 245, 1),
                      fontSize: Dimensions.fontSize14,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Container(
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

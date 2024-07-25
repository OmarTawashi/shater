import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../../../util/dimensions.dart';
import '../../base/text_custom.dart';

class AddChildButton extends StatelessWidget {
  const AddChildButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: (){
            Get.toNamed(Routes.getAddChildScreen());
          },
          child: Container(
            height: 60.h,
            width: 60.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: Color.fromRGBO(72, 131, 196, 1), shape: BoxShape.circle),
            child: Icon(
              Icons.add,
              color: Color.fromRGBO(159, 191, 216, 1),
              size: 32.sp,
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.paddingSize10,
        ),
        CustomText(
          text: 'add student'.tr,
          textAlign: TextAlign.center,
          maxLine: 2,
          overFlow: TextOverflow.ellipsis,
          color: Color.fromRGBO(159, 191, 216, 1),
          fontSize: Dimensions.fontSize10,
        )
      ],
    );
  }
}

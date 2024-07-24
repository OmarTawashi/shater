import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';

import '../../../util/dimensions.dart';
import 'custom_intike_container.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String? title;
  const BackAppBar({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leadingWidth: 130.w,
        toolbarHeight: 65,
        backgroundColor: COLORS.primaryColor,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: CustomIntikeContainer(
                paddingHorizontal: Dimensions.paddingSize12,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_back_ios_new_sharp,
                        color: Colors.white, size: 18),
                    const SizedBox(
                      width: Dimensions.paddingSize10,
                    ),
                    CustomText(
                      text: title ?? "",
                      color: Colors.white,
                      fontSize: Dimensions.fontSize14,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              )

            ),
          ],
        )
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 50);
}

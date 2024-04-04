import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/presentation/screens/base/image_shimmer.dart';
import 'package:shater/presentation/screens/base/text_shimmer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../util/color.dart';
import '../../../../../util/dimensions.dart';

class SubjectShimmer extends StatelessWidget {
  const SubjectShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Shimmer.fromColors(
        enabled: true,
        direction: ShimmerDirection.rtl,
        baseColor: Colors.white,
        highlightColor: Colors.grey,
        period: Duration(seconds: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                ImageShimmer(),
                const SizedBox(
                  width: Dimensions.paddingSize16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      shimmerText(
                        width: 130,
                      ),
                      SizedBox(
                        height: Dimensions.paddingSize12,
                      ),
                      shimmerText(),
                      SizedBox(
                        height: Dimensions.paddingSize8,
                      ),
                      shimmerText(),
                    ],
                  ),
                ),
                shimmerText()
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
      ),
    );
  }
}

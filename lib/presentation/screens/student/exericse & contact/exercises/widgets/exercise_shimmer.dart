import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/presentation/screens/base/image_shimmer.dart';
import 'package:shater/presentation/screens/base/text_shimmer.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shimmer/shimmer.dart';

class ExerciseShimmer extends StatelessWidget {
  const ExerciseShimmer({super.key});

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
                    ],
                  ),
                ),
                shimmerText()
              ],
            ),
            Divider(
              color: COLORS.primaryColor.withOpacity(0.15),
              height: 10,
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

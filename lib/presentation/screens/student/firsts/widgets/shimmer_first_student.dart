import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/image_shimmer.dart';
import 'package:shater/presentation/screens/base/text_shimmer.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class ShimmerFirstStudent extends StatelessWidget {
  const ShimmerFirstStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.paddingSize5),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: COLORS.primaryColor,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(12, 26, 12, 26),
              margin: const EdgeInsets.only(right: Dimensions.paddingSize16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: COLORS.whiteColor,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: ImageShimmer(
                            shape: BoxShape.circle,
                          )),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                shimmerText(
                                  width: 100,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                shimmerText(),
                                SizedBox(
                                  height: 3,
                                ),
                                shimmerText()
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        shimmerText(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

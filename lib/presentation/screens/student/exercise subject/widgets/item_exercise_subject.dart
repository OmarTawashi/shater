import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../util/dimensions.dart';
import '../../../../../util/images.dart';
import '../../../base/text_custom.dart';

class ItemExerciseSubject extends StatelessWidget {
  final int index;
  const ItemExerciseSubject({
    super.key,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: index % 3 == 0 ? 8 : 8,
        right: index % 3 == 2 ? 8 : 8,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(IMAGES.exerciseSubject),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.5),
              ),
              child: const CustomText(
                text: '37',
                color: Colors.white,
                fontSize: Dimensions.fontSize14,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: Dimensions.paddingSize25,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.black.withOpacity(0.5),
              ),
              child: CustomText(
                text: '37' '\t' + 'exercise'.tr,
                color: Colors.white,
                fontSize: Dimensions.fontSize12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

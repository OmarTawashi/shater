
import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class ItemChildern extends StatelessWidget {
  const ItemChildern({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          clipBehavior: Clip.hardEdge,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(IMAGES.firstImages),
              )),
        ),
        SizedBox(
          height: Dimensions.paddingSize5,
        ),
        CustomText(
          text: 'sss',
          color: Colors.grey,
          fontSize: Dimensions.fontSize14,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/dimensions.dart';

class ItemChildern extends StatelessWidget {
  final String? image;
  final String? title;
  final Function()? onTap;
  const ItemChildern({
    super.key,
    this.image,
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
                  image: AssetImage(image ?? ''),
                )),
          ),
          SizedBox(
            height: Dimensions.paddingSize5,
          ),
          CustomText(
            text: title ?? '',
            color: Colors.white,
            fontSize: Dimensions.fontSize14,
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class ItemChildern extends StatelessWidget {
  final String? image;
  final String? title;
  final bool isSelected;
  final Function()? onTap;

  const ItemChildern({
    super.key,
    this.image,
    this.title,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: 60,
                height: 60,
                clipBehavior: Clip.hardEdge,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(image ??
                          'https://as1.ftcdn.net/v2/jpg/05/16/27/58/1000_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg'),
                    )),
              ),
              !isSelected ? Container(
                width: 60,
                height: 60,
                clipBehavior: Clip.hardEdge,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.35),
                ),
              ) : SizedBox.shrink(),
            ],
          ),
          SizedBox(
            height: Dimensions.paddingSize5,
          ),
          CustomText(
            text: title ?? '',
            color: !isSelected ? Colors.white.withOpacity(0.7): Colors.white ,
            fontSize: Dimensions.fontSize14,
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}

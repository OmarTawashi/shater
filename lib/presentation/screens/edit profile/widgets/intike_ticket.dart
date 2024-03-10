import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/dimensions.dart';

class IntikeTicket extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final String? assetName;
  const IntikeTicket({super.key, this.onTap, this.text, this.assetName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(Dimensions.paddingSize12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: CustomSvgPicture(
              assetName: assetName ?? '',
            ),
          ),
          SizedBox(
            width: Dimensions.paddingSize16,
          ),
          CustomText(
            text: text ?? '',
            fontSize: Dimensions.fontSize14,
            color: Colors.white,
            maxLine: 1,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
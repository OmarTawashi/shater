import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/modules/screens/base/text_custom.dart';

import '../../../util/dimensions.dart';

class TextNotAcount extends StatelessWidget {
  final String startText;
  final String lastText;
  final Function()? onTap;
  final bool isShowIcon;
  final MainAxisAlignment mainAxisAlignment ;

  const TextNotAcount(
      {super.key,
      required this.startText,
      required this.lastText,
      this.isShowIcon = true,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        CustomText(
          text: startText.tr + "\t",
          color: const Color.fromRGBO(159, 191, 216, 1),
          fontSize: Dimensions.fontSize14,
          fontWeight: FontWeight.w400,
        ),
        InkWell(
            onTap: onTap,
            child: CustomText(
              text: lastText.tr,
              color: Color.fromRGBO(0, 207, 254, 1),
              fontSize: Dimensions.fontSize14,
              fontWeight: FontWeight.w400,
            )),
        isShowIcon
            ? Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
                size: 18,
              )
            : SizedBox()
      ],
    );
  }
}

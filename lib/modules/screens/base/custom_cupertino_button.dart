import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shater/modules/screens/base/svgpicture_custom.dart';
import 'package:shater/modules/screens/base/text_custom.dart';

import '../../../util/color.dart';
import '../../../util/dimensions.dart';

class CustomCupertinoButton extends StatelessWidget {
  final String? assetName;
  final String? text;
  final Widget? trailing;
  final Function()? onPressed;
  final Color color;
  const CustomCupertinoButton({
    super.key,
    this.assetName,
    this.text,
    this.onPressed,
    this.trailing,
    this.color = const Color.fromRGBO(72, 131, 196, 1),
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(13),
      padding: const EdgeInsets.all(16),
      color: color,
      disabledColor: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          assetName != null
              ? CustomSvgPicture(assetName: assetName!)
              : SizedBox(),
          CustomText(
            text: text ??'',
            textHeight: 1,
            textAlign: TextAlign.center,
            color:onPressed != null ? Colors.white :  COLORS.textColor,
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.fontSize15,
          ),
          trailing ?? SizedBox()
        ],
      ),
    );
  }
}

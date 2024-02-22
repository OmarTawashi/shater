
import 'package:flutter/material.dart';

import '../../../../util/dimensions.dart';
import '../../base/text_custom.dart';

class IntikeProfileImoji extends StatelessWidget {
  final String? asset;
  final String? text;
  final Function()? onTap;
  final bool isEnable;
  const IntikeProfileImoji({
    super.key,
    this.asset,
    this.text,
    this.onTap,
    this.isEnable = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
                color: Color.fromRGBO(72, 131, 196, 1), shape: BoxShape.circle),
            child: Image.asset(
              asset ?? 'asset',
              height: isEnable ? 70 : 50,
              width: isEnable ? 70 : 50,
              color: isEnable ? Colors.white : Color.fromRGBO(159, 191, 216, 1),
            ),
          ),
          SizedBox(
            height: Dimensions.paddingSize5,
          ),
          CustomText(
            text: text ?? '',
            color: isEnable ? Colors.white : Color.fromRGBO(159, 191, 216, 1),
            fontSize: Dimensions.fontSize12,
          )
        ],
      ),
    );
  }
}

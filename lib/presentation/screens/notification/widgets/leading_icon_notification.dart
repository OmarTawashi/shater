import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/images.dart';

class LeadingIconNotification extends StatelessWidget {
  final double? radius;
  final double? height;
  final double? width;
  const LeadingIconNotification({
    super.key,
    this.radius,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: COLORS.secanderyColor,
      radius: radius ?? 35,
      child: CustomSvgPicture(
        assetName: ICONS.logoAppt,
        height: height ?? 40,
        width: width ?? 40,
      ),
    );
  }
}

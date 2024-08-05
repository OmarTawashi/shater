import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgPicture extends StatelessWidget {
  final String assetName;
  final BoxFit fit;
  final Color? color;
  final double? width;
  final double? height;
  final Function()? ontap;

  const CustomSvgPicture({
    super.key,
    required this.assetName,
    this.fit = BoxFit.contain,
    this.color,
    this.ontap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: SvgPicture.asset(
        assetName,
        fit: fit,
        colorFilter:
            color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
        width: width,
        height: height,
      ),
    );
  }
}

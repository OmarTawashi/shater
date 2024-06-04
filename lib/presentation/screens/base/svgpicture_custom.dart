import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgPicture extends StatelessWidget {
  final String assetName;
  final BoxFit fit;
  final Color? color;
  final double? width;
  final double? height;
  const CustomSvgPicture({
    super.key,
    required this.assetName,
    this.fit = BoxFit.contain,
    this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      fit: fit,
      colorFilter:
          color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
      width: width,
      height: height,
    );
  }
}

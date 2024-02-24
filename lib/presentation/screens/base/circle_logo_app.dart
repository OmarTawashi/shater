import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/util/images.dart';

class CircleLogoApp extends StatelessWidget {
  const CircleLogoApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: Colors.white, shape: BoxShape.circle),
      child: const CustomSvgPicture(assetName: ICONS.logoAppt),
    );
  }
}
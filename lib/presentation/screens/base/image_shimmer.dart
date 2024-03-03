import 'package:flutter/material.dart';

class ImageShimmer extends StatelessWidget {
  final BoxShape shape;
  const ImageShimmer({super.key, this.shape = BoxShape.rectangle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 70,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: shape,
          borderRadius: shape != null ? null : BorderRadius.circular(8)),
    );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';

class ImageUser extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final File? image;

  const ImageUser(
      {super.key, this.imageUrl, this.width, this.height, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 120.h,
      width: width ?? 120.w,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          border: imageUrl == null || imageUrl == ''
              ? Border.all(
                  color: Colors.white,
                )
              : null,
          shape: BoxShape.circle),
      child: image != null
          ? Image.file(
              image!,
              fit: BoxFit.cover,
            )
          : CachedNetworkImageWidget(
              imageUrl: imageUrl ?? '',
              fit: BoxFit.cover,
            ),
    );
  }
}

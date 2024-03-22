import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/util/dimensions.dart';

class ImageQuestionSection extends StatelessWidget {
  final String? imageUrl;
  const ImageQuestionSection({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 215.h,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(Dimensions.paddingSize16),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(8),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        placeholder: (context, url) => Container(
          color: Colors.amber,
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.amber,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/cached_video_player_widget.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/util/api_constant.dart';
import 'package:shater/util/dimensions.dart';

class ImageQuestionSection extends StatelessWidget {
  final String? url;
  final String? media;
  const ImageQuestionSection({super.key, this.url, this.media});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 215.h,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(Dimensions.paddingSize16),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.black12, strokeAlign: BorderSide.strokeAlignOutside),
        borderRadius: BorderRadius.circular(8),
      ),
      child: getWidget(media ?? '', url ?? ''),
    );
  }

  Widget getWidget(String media, String url) {
    switch (media) {
      case 'video':
        return CachedVideoPlayerWidget(url: url);
      case 'image':
        return CachedNetworkImageWidget(
            imageUrl: "${ApiConstant.baseUrl}${"/${url}"}");
      default:
        return CachedNetworkImageWidget(imageUrl: url);
    }
  }
}

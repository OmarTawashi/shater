import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/cached_video_player_widget.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:shater/util/api_constant.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class ImageQuestionSection extends StatelessWidget {
  final String? url;
  final String? text;
  final String? media;
  const ImageQuestionSection({super.key, this.url, this.text, this.media});

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
        return CachedVideoPlayerWidget(
          url: url,
          fit: BoxFit.cover,
        );
      case 'image':
        return CachedNetworkImageWidget(
          imageUrl: "${ApiConstant.baseUrl}${"/${url}"}",
          fit: BoxFit.cover,
        );
      case 'audio':
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(builder: (context) {
              Get.find<QuestionController>().playAudioUrl(url);
              return Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      color: COLORS.secanderyColor, shape: BoxShape.circle),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: COLORS.whiteColor, shape: BoxShape.circle),
                    child: Center(
                      child: Icon(
                        Icons.campaign_rounded,
                        color: COLORS.secanderyColor,
                        size: 40,
                      ),
                    ),
                  ));
            })
          ],
        );
      case 'text' || "":
        return Center(
          child: CustomText(
            text: text ?? '',
            fontSize: Dimensions.fontSize18,
            textAlign: TextAlign.center,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        );
      default:
        return CachedNetworkImageWidget(
          imageUrl: "${ApiConstant.baseUrl}${"/${url}"}",
          fit: BoxFit.cover,
        );
    }
  }
}

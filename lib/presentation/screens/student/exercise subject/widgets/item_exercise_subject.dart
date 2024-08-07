import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shater/data/model/subject_video_model.dart';
import 'package:shater/util/images.dart';
import '../../../../../util/dimensions.dart';
import '../../../base/text_custom.dart';

class ItemExerciseSubject extends StatelessWidget {
  final int index;
  final Function()? onTap;
  final SubjectVideo? subjectVideo;
  final String? image;
  final String? subText;
  final String? pageNo;
  final Color? color;
  const ItemExerciseSubject({
    super.key,
    this.subjectVideo,
    this.onTap,
    this.image,
    this.subText,
    this.pageNo,
    this.color,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          left: index % 3 == 0 ? 8 : 8,
          right: index % 3 == 2 ? 8 : 8,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(13),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              image ?? "",
              errorListener: (p0) => AssetImage(IMAGES.exerciseSubject),
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color ?? Colors.black.withOpacity(0.5),
                ),
                child: CustomText(
                  text: pageNo ?? "",
                  color: Colors.white,
                  textAlign: TextAlign.center,
                  fontSize: Dimensions.fontSize14,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: Dimensions.paddingSize25,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: color ?? Colors.black.withOpacity(0.5),
                ),
                child: CustomText(
                  text: subText ?? "",
                  //  subjectVideo!.page!.isExplain! ? "yes" : "no",
                  //  "${subjectVideo!.page!.isExplain?""}"
                  //         '\t' +
                  //     'exercises'.tr,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                  fontSize: Dimensions.fontSize12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

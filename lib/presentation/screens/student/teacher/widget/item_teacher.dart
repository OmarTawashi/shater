import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/firsts/widgets/item_first_student.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class ItemTeacher extends StatelessWidget {
  final String? imageUrl;
  final String? imageSubjectUrl;
  final String? name;
  final String? subject;
  final String? teacherStar;
  const ItemTeacher(
      {super.key,
      this.imageUrl,
      this.name,
      this.subject,
      this.teacherStar,
      this.imageSubjectUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 5,
              ),
              shape: BoxShape.circle,
            ),
            child: Container(
              height: 80,
              width: 80,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CachedNetworkImageWidget(
                imageUrl: imageUrl ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: Dimensions.paddingSize8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextStudentInfo(
                  textTitle: name ?? '',
                  title: 'name',
                  titleColor: Colors.grey,
                  textTitleColor: Colors.black,
                ),
                SizedBox(
                  height: Dimensions.paddingSize10,
                ),
                TextStudentInfo(
                  textTitle: subject ?? '',
                  title: 'subject',
                  titleColor: Colors.grey,
                  textTitleColor: COLORS.secanderyColor,
                ),
                SizedBox(
                  height: Dimensions.paddingSize10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CachedNetworkImageWidget(
                        imageUrl: imageSubjectUrl ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.paddingSize8,
                    ),
                    CustomSvgPicture(assetName: ICONS.star),
                    SizedBox(
                      width: Dimensions.paddingSize8,
                    ),
                    CustomText(
                      text: "${teacherStar}",
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSize14,
                      color: COLORS.secanderyColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: COLORS.primaryColor),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'اشترك',
                    color: COLORS.whiteColor,
                    textAlign: TextAlign.start,
                    fontSize: Dimensions.fontSize12,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: Dimensions.paddingSize5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: COLORS.whiteColor,
                    size: 16,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

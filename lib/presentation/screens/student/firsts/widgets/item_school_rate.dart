import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/data/model/rate_school_model.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/firsts/widgets/item_first_student.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class ItemSchoolRate extends StatelessWidget {
  final SchoolRateModel? school;
  final int? index;
  const ItemSchoolRate({super.key, this.school, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.paddingSize5.h),
      child: Row(
        children: [
          Container(
            padding: index! > 9
                ? const EdgeInsets.fromLTRB(10, 26, 10, 26)
                : const EdgeInsets.fromLTRB(16, 26, 16, 26),
            margin: const EdgeInsets.only(right: Dimensions.paddingSize16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: COLORS.primaryColor,
            ),
            child: CustomText(
              text: "${index}",
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: Dimensions.fontSize16.sp,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: COLORS.primaryColor),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          shape: BoxShape.circle),
                      child: CircleAvatar(
                        child: CachedNetworkImageWidget(
                          imageUrl: school?.school?.image ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextStudentInfo(
                                  textTitle: school?.school?.name,
                                  title: 'school',
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextStudentInfo(
                                  textTitle: school?.school?.type,
                                  title: 'التصنيف',
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextStudentInfo(
                                  textTitle: school?.school?.city?.name,
                                  title: 'المنطقة',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: "${school?.score}",
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontSize14.sp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: Dimensions.paddingSize8,
                      ),
                      CustomSvgPicture(assetName: ICONS.star),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

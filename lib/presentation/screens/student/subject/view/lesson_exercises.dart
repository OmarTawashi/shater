import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/presentation/screens/student/subject/widgets/custom_appbar.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';

import '../../../base/cashed_network_image_widget.dart';

class LessonExercisesScreeen extends StatelessWidget {
  const LessonExercisesScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          CustomAppBar(
            boxTitle: "جمع وطرح الاعداد",
            backButtonTitle: "ألاء سلامة",
            withImage: false,
            appbarHight: 180.h,
          ),
          Expanded(
            child: RefreshIndicator.adaptive(
              color: Colors.black,
              onRefresh: () async {
                print("object refreesh");
              },
              child: Padding(
                padding: EdgeInsets.only(top: 0.h, bottom: 20.h),
                child: ListView.separated(
                    padding: EdgeInsets.all(16),
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {},
                          //onTap: () => Get.to(() => TeacherLessonsforSubject()),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              // color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 107.h,
                                  width: 81.h,
                                  decoration: BoxDecoration(
                                    color: Colors.brown.shade300,
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                  ),
                                  child: CachedNetworkImageWidget(
                                      imageUrl: "imageUrl"),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "صفحة 33",
                                      style: FontStyleConstant.hNLTBMedium
                                          .copyWith(
                                              color: Colors.white,
                                              fontSize: Dimensions.fontSize18),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: COLORS.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          height: 40.h,
                                          // width: 100.w,
                                          child: Text(
                                            "3 تدريبات",
                                            style: TextStyle(
                                                color: COLORS.secanderyColor,
                                                fontSize: 16.sp),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {},
                                  child: CircleAvatar(
                                    backgroundColor: COLORS.primaryColor,
                                    radius: 30.r,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => Divider(
                          height: 1.5.h,
                          color: COLORS.disabledColor,
                        ),
                    itemCount: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

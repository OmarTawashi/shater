import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/student/subject/view/lesson_exercises.dart';
import 'package:shater/presentation/screens/student/subject/widgets/custom_appbar.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';

class TeacherLessonsforSubject extends StatelessWidget {
  const TeacherLessonsforSubject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          // app bar
          CustomAppBar(
            backButtonTitle: "teachers".tr,
            boxTitle: "اسم المدرس",
            withImage: true,
            
          ),
// List
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
                          onTap: () => Get.to(() => LessonExercisesScreeen()),
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
                                  width: 5.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "جمع/طرح الأعداد الكلية",
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
                                            " 37 صفحات ",
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
                    separatorBuilder: (context, index) => SizedBox(
                          height: 15.h,
                        ),
                    itemCount: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

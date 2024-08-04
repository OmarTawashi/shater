import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/student/subject/view/teacher_lessons_for_subject.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';

class TeachersOfSubjectScreen extends StatelessWidget {
  const TeachersOfSubjectScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          // app bar
          Container(
            height: 250.h,
            color: COLORS.primaryColor,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsetsDirectional.only(
                          top: 30.h,
                          start: 30.w,
                        ),
                        height: 46.h,
                        width: 82.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 18,
                              color: Colors.white,
                            ),
                            Text(
                              "subjects".tr,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 100.h,
                  width: 80.w,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CachedNetworkImageWidget(
                    imageUrl: '',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsetsDirectional.all(10),
                  height: 45.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: COLORS.backGroundColor),
                  child: Text(
                    "season_one".tr,
                    style: FontStyleConstant.hNLTBMedium.copyWith(
                      color: Colors.white,
                      fontSize: Dimensions.fontSize18,
                    ),
                  ),
                ),
              ],
            ),
          ),
// List
          Expanded(
            child: RefreshIndicator.adaptive(
              color: Colors.black,
              onRefresh: () async {
                print("object refreesh");
              },
              // onRefresh: ()  {
              // },
              child: Padding(
                padding: EdgeInsets.only(top: 0.h, bottom: 20.h),
                child: ListView.separated(
                    padding: EdgeInsets.all(16),
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Get.to(() => TeacherLessonsforSubject()),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 50.r,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "محمد حسن ",
                                      style: FontStyleConstant.hNLTBMedium
                                          .copyWith(
                                              color: Colors.black,
                                              fontSize: Dimensions.fontSize18),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          " الرياضيات ",
                                          style: FontStyleConstant.hNLTBMedium
                                              .copyWith(
                                                  color: COLORS.secanderyColor,
                                                  fontSize:
                                                      Dimensions.fontSize16),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Colors.amber,
                                        ),
                                        Text("4.7")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: COLORS.hintColor,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          height: 35.h,
                                          width: 75.w,
                                          child: Text(
                                            "درس 37",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: COLORS.hintColor,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          height: 35.h,
                                          width: 75.w,
                                          child: Text(
                                            "تمرين 37",
                                            style:
                                                TextStyle(color: Colors.white),
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
                                    backgroundColor: COLORS.secanderyColor,
                                    radius: 25.r,
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

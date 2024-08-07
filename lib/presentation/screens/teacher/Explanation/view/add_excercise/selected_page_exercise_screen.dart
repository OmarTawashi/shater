import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/teacher/Explanation/selected_page_exercise_controller_.dart';
import 'package:shater/presentation/screens/teacher/My%20Explanation/custom_button.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

import '../../../../../../util/font_style.dart';

class SelectedPageEerciseScreen extends StatelessWidget {
  const SelectedPageEerciseScreen({super.key, this.selected_page});
  final String? selected_page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 60.w,
        toolbarHeight: 110.h,
        backgroundColor: COLORS.secanderyColor,
        automaticallyImplyLeading: false,
        excludeHeaderSemantics: true,
        leading: Padding(
          padding: EdgeInsetsDirectional.only(start: 10.w),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: CircleAvatar(
              radius: 50.r,
              backgroundColor: COLORS.primaryColor,
              child: const Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.white,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "practices".tr,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 10.w),
            child: GestureDetector(
              onTap: () => Get.toNamed(
                Routes.getTeacherAddExercise(),
              ),
              child: CircleAvatar(
                radius: 25.r,
                backgroundColor: COLORS.primaryColor,
                child: const Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: GetBuilder<SelectedPageExerciseControoler>(
        builder: (controller) => controller.isloading ||
                controller.specificPageExercisesModel == null
            ? Center(
                child: CircularProgressIndicator(
                  color: COLORS.secanderyColor,
                ),
              )
            : Column(
                children: [
                  AnimatedContainer(
                    width: double.infinity,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                    padding: const EdgeInsets.all(16),
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: COLORS.secanderyColor,
                    ),
                    child: Container(
                      height: 50.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: COLORS.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CustomText(
                        text:
                            "صفحة رقم ${controller.specificPageExercisesModel!.items!.first.pageNo!.toString()} ",
                        textAlign: TextAlign.center,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontSize16,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(16),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                              padding: EdgeInsets.all(16),
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "التدريب",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                  Text(
                                    controller
                                            .specificPageExercisesModel!
                                            .items!
                                            .first
                                            .questions![index]
                                            .title ??
                                        "",
                                    style: FontStyleConstant.hNLTRegular,
                                  ),
                                  Text(
                                    "  بواسطة : ${controller.specificPageExercisesModel!.items!.first.questions![index].teacher!.name!}",
                                    style: FontStyleConstant.hNLTRegular,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomeButton(
                                        borderRadius: 10,
                                        backgroundColor: COLORS.primaryColor,
                                        height: 30,
                                        width: 76,
                                        title: "تكرار",
                                        onClick: () {},
                                      ),
                                      CustomeButton(
                                        borderRadius: 10,
                                        backgroundColor: COLORS.primaryColor,
                                        height: 30,
                                        width: 76,
                                        title: "معاينة",
                                        onClick: () {},
                                      ),
                                      CustomeButton(
                                        borderRadius: 10,
                                        backgroundColor: COLORS.primaryColor,
                                        height: 30,
                                        width: 76,
                                        title: "تعديل",
                                        onClick: () {},
                                      ),
                                      CustomeButton(
                                        borderRadius: 10,
                                        backgroundColor: COLORS.errorColor,
                                        height: 30,
                                        width: 76,
                                        title: "حذف",
                                        onClick: () {},
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                        separatorBuilder: (context, index) => Divider(
                              color: COLORS.dividerColor,
                              thickness: 3,
                            ),
                        itemCount: controller.specificPageExercisesModel!.items!
                            .first.questions!.length),
                  )
                ],
              ),
      ),
    );
  }
}

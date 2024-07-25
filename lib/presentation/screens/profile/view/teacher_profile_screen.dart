import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/edit%20profile/binding/edit_profile_binding.dart';
import 'package:shater/presentation/screens/edit%20profile/view/teacher/edit_teacher_profile_screen.dart';

import '../../../../core/controller/shared_prefrences.dart';
import '../../../../data/model/user.dart';
import '../../../../util/color.dart';
import '../../../../util/dimensions.dart';
import '../../auth/base login/widgets/rate_app.dart';
import '../../auth/sign in/controller/sign_in_controller.dart';
import '../../base/button_back.dart';
import '../../base/button_settings.dart';
import '../../base/image_user.dart';
import '../../base/text_custom.dart';
import '../controller/profile_controller.dart';
import '../../teacher_profile/widgets/brief_widget.dart';
import '../../teacher_profile/widgets/qualifications_widget.dart';

class TeacherProfileScreen extends StatefulWidget {
  const TeacherProfileScreen({super.key});

  @override
  State<TeacherProfileScreen> createState() => _TeacherProfileScreenState();
}

class _TeacherProfileScreenState extends State<TeacherProfileScreen> {
  SignInController signInController = Get.find<SignInController>();
  ProfileController controller = Get.find<ProfileController>();
  User? user = SharedPrefs.user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (controller.profileData == null) {
      controller.getTeacherProfile();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
        leading: ButtonBack(),
        actions: [
          ButtonSettings(
            onTap: () {
              Get.to(()=>EditTeacherProfileScreen(),binding: EditProfileBinding());
            },
          ),
        ],
      ),
      body: GetBuilder<ProfileController>(
          init: controller,
          builder: (controller) {
            return Stack(
              children: [
                IgnorePointer(
                  ignoring: controller.isLoading,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 0,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.toNamed(Routes.getResultSubjectScreen());
                          },
                          child: ImageUser(
                            imageUrl: controller.profileData?.image ?? '',
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RateApp(
                              initRate: ((controller.profileData?.rateStar ?? 0) * 1.0),
                              itemSize: 24.sp,
                            ),
                            SizedBox(
                              width: 12.5.w,
                            ),
                            Visibility(
                              visible: controller.profileData?.rateStar != null,
                              child: Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                                decoration: BoxDecoration(
                                    color: COLORS.secanderyColor,
                                    borderRadius: BorderRadius.circular(32)),
                                alignment: Alignment.center,
                                child: CustomText(
                                  text: controller.profileData?.rateStar == null
                                      ? "0.0"
                                      : '${controller.profileData?.rateStar}',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: (Dimensions.fontSize15 + 1.sp).sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 17.w),
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          decoration: BoxDecoration(
                              color: COLORS.strokeColor,
                              borderRadius: BorderRadius.circular(13.r)),
                          alignment: Alignment.center,
                          child: CustomText(
                            text: controller.profileData?.name ?? '',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: (Dimensions.fontSize15 + 1.sp).sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        QualificationsWidget(),
                        SizedBox(
                          height: 10.h,
                        ),
                        BriefWidget(),
                      ],
                    ),
                  ),
                ),
                controller.isLoading
                    ? Container(
                  height: Get.height,
                  width: Get.width,
                  child: BackdropFilter(
                    filter: ColorFilter.mode(Colors.white24, BlendMode.color),
                    child: Center(
                        child: CircularProgressIndicator(
                          color: COLORS.whiteColor,
                        )),
                  ),
                )
                    : SizedBox()
              ],
            );
          }),
    );
  }
}





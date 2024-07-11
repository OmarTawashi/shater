import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/data/model/result_exam_model.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/presentation/screens/auth/base%20login/widgets/rate_app.dart';
import 'package:shater/presentation/screens/auth/sign%20in/controller/sign_in_controller.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/custom_cupertino_button.dart';
import 'package:shater/presentation/screens/base/image_user.dart';
import 'package:shater/presentation/screens/base/section_header_delegate.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/profile/controller/profile_controller.dart';
import 'package:shater/presentation/screens/profile/widgets/item_subscrip_subiect.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../../../core/controller/shared_prefrences.dart';
import '../widgets/profile_children_widget.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  SignInController signInController = Get.find<SignInController>();
  ProfileController controller = Get.find<ProfileController>();
  User? parentUser = SharedPrefs.user;
  ChildUser? childUser = SharedPrefs.selectedChild;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (controller.profileData == null) {
      controller.getStudentProfile();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
        leading: ButtonBack(),
      ),
      body: GetBuilder<ProfileController>(
        init: controller,
        builder: (controller) => Stack(
          children: [
            IgnorePointer(
              ignoring: controller.isLoading,
              child: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: Dimensions.paddingSize5.h,
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SectionHeaderDelegate(
                    height: 100.h,
                    widget: ProfileChildrenWidget(
                      parentUser: parentUser,
                      controller: controller,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextNumber(
                        text: 'class',
                        secWidget: CustomText(
                          text: controller.profileData?.classes?.title
                                  ?.replaceRange(0, 5, '') ??
                              '',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: (Dimensions.fontSize15 + 1.sp).sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.getResultSubjectScreen());
                        },
                        child: ImageUser(
                          imageUrl: signInController.selectedChild?.image ?? '',
                        ),
                      ),
                      TextNumber(
                        text: 'points',
                        secWidget: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomSvgPicture(assetName: ICONS.point),
                            SizedBox(
                              width: Dimensions.paddingSize5,
                            ),
                            CustomText(
                              text:
                                  controller.profileData?.rateStar.toString() ??
                                      "",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: Dimensions.fontSize13 + 1.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: Dimensions.paddingSize20 - 5,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Center(
                      child: Column(
                    children: [
                      CustomText(
                        text: controller.profileData?.email ?? '',
                        fontSize: Dimensions.fontSize16,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                      SizedBox(
                        height: Dimensions.paddingSize16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSize16),
                        child: CustomCupertinoButton(
                          color: COLORS.secanderyColor,
                          onPressed: () {
                            Get.toNamed(Routes.getEditProfileScreen());
                          },
                          text:  controller.profileData?.name ?? '',
                          trailing: CustomSvgPicture(assetName: ICONS.setting),
                        ),
                      )
                    ],
                  )),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: Dimensions.paddingSize12,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'subscript',
                          color: Colors.white,
                          fontSize: Dimensions.fontSize18,
                          fontWeight: FontWeight.w300,
                          maxLine: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  childCount: 2,
                  (context, index) => ItemSubscribSubject(),
                )),
                // SliverToBoxAdapter(
                //   child: Container(
                //     margin: EdgeInsets.symmetric(
                //         horizontal: Dimensions.paddingSize16),
                //     padding: EdgeInsets.all(16),
                //     decoration: BoxDecoration(
                //       color: COLORS.backGroundColor,
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Row(
                //           children: [
                //             CustomText(
                //               text: 'results',
                //               color: Colors.white,
                //               fontSize: Dimensions.fontSize18 + 2,
                //               fontWeight: FontWeight.w300,
                //               maxLine: 1,
                //             ),
                //             Expanded(
                //               child: Padding(
                //                 padding: const EdgeInsets.only(left: 40.0),
                //                 child: CustomSvgPicture(
                //                   assetName: ICONS.resultTapActive,
                //                   color: Colors.white,
                //                   height: 40,
                //                   width: 40,
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 40,
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 4.0),
                //           child: Row(
                //             // runAlignment: WrapAlignment.spaceBetween,
                //             // alignment: WrapAlignment.spaceBetween,
                //             // spacing: 30,
                //             // runSpacing: 16,
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: List.generate(
                //               controller.resultExams.length,
                //               (index) => ItemResult(
                //                 resultExam: controller.resultExams[index],
                //                 onTap: () {
                //                   controller.setResultExam(
                //                       controller.resultExams[index]);
                //                   Get.toNamed(Routes.getResultSubjectScreen());
                //                 },
                //               ),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: Dimensions.paddingSize20,
                  ),
                )
              ]),
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
        ),
      ),
    );
  }
}

class ItemResult extends StatelessWidget {
  final ResultExam? resultExam;
  final Function()? onTap;

  const ItemResult({super.key, this.onTap, this.resultExam});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SimpleCircularProgressBar(
                valueNotifier: ValueNotifier(30),
                maxValue: 100,
                size: 80,
                backColor: Colors.white,
                fullProgressColor: COLORS.secanderyColor,
                progressColors: [COLORS.secanderyColor ?? Colors.black],
                backStrokeWidth: 11,
                progressStrokeWidth: 11,
                mergeMode: true,
              ),
              Container(
                width: 70.0,
                height: 70.0,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CachedNetworkImageWidget(
                  imageUrl: resultExam?.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.paddingSize12,
          ),
          Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 38,
            color: Colors.white54,
          )
        ],
      ),
    );
  }
}

class TextNumber extends StatelessWidget {
  final String? text;
  final Widget? secWidget;

  const TextNumber({super.key, this.text, this.secWidget});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text ?? "",
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontSize: Dimensions.fontSize16,
        ),
        SizedBox(
          height: Dimensions.paddingSize5.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
              color: COLORS.secanderyColor,
              borderRadius: BorderRadius.circular(32)),
          child: secWidget,
        )
      ],
    );
  }
}

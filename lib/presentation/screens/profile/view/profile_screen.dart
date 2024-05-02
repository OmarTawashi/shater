import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/auth/base%20login/widgets/rate_app.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/custom_cupertino_button.dart';
import 'package:shater/presentation/screens/base/image_user.dart';
import 'package:shater/presentation/screens/base/section_header_delegate.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/profile/controller/profile_controller.dart';
import 'package:shater/presentation/screens/profile/widgets/intike_profile_imoji.dart';
import 'package:shater/presentation/screens/profile/widgets/item_subscrip_subiect.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: COLORS.primaryColor,
        appBar: AppBar(
          backgroundColor: COLORS.primaryColor,
          leading: ButtonBack(),
        ),
        body: GetBuilder<ProfileController>(
            builder: (controller) => Stack(children: [
                  IgnorePointer(
                    ignoring: controller.isLoading,
                    child: CustomScrollView(slivers: [
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: SectionHeaderDelegate(
                          height: 85,
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IntikeProfileImoji(
                                asset: IMAGES.firstImages,
                                text: 'mohamed',
                                isEnable: true,
                              ),
                              IntikeProfileImoji(
                                asset: IMAGES.firstImages,
                                text: 'mohamed',
                              ),
                              IntikeProfileImoji(
                                asset: IMAGES.add,
                                text: 'add Student',
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: Dimensions.paddingSize25 + 5,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextNumber(
                              text: 'class',
                              secWidget: CustomText(
                                text: controller.user?.classes?.title
                                        ?.replaceRange(0, 5, '') ??
                                    '',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: Dimensions.fontSize15 + 1.sp,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.getResultSubjectScreen());
                              },
                              child: ImageUser(
                                imageUrl: controller.user?.image ?? '',
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
                                        controller.user?.rateStar.toString() ??
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
                          height: Dimensions.paddingSize20,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Center(
                            child: Column(
                          children: [
                            RateApp(
                              initRate:
                                  double.tryParse(controller.user?.rate ?? ''),
                            ),
                            SizedBox(
                              height: Dimensions.paddingSize16,
                            ),
                            CustomText(
                              text: controller.user?.email ?? '',
                              fontSize: Dimensions.fontSize16,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                            SizedBox(
                              height: Dimensions.paddingSize12,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Dimensions.paddingSize16),
                              child: CustomCupertinoButton(
                                color: COLORS.secanderyColor,
                                onPressed: () {
                                  Get.toNamed(Routes.getEditProfileScreen());
                                },
                                text: controller.user?.name ?? '',
                                trailing:
                                    CustomSvgPicture(assetName: ICONS.setting),
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
                                color: Color.fromRGBO(149, 150, 152, 1),
                                fontSize: Dimensions.fontSize16,
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
                      ))
                    ]),
                  ),
                  controller.isLoading
                      ? Container(
                          height: Get.height,
                          width: Get.width,
                          child: BackdropFilter(
                            filter: ColorFilter.mode(
                                Colors.white24, BlendMode.color),
                            child: Center(
                                child: CircularProgressIndicator(
                              color: COLORS.whiteColor,
                            )),
                          ),
                        )
                      : SizedBox()
                ])));
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

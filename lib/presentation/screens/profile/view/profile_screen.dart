import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/presentation/screens/auth/base%20login/widgets/rate_app.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/custom_cupertino_button.dart';
import 'package:shater/presentation/screens/base/section_header_delegate.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/profile/widgets/intike_profile_imoji.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: COLORS.primaryColor,
            leading: ButtonBack(),
            pinned: true,
          ),
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
                    text: '4',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: Dimensions.fontSize15 + 1.sp,
                  ),
                ),
                Container(
                    height: 120,
                    width: 120,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Image.asset(
                      IMAGES.firstImages,
                      fit: BoxFit.cover,
                    )),
                TextNumber(
                  text: 'class',
                  secWidget: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomSvgPicture(assetName: ICONS.point),
                      SizedBox(
                        width: Dimensions.paddingSize5,
                      ),
                      CustomText(
                        text: '333',
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
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
                child: Column(
              children: [
                RateApp(),
                SizedBox(
                  height: Dimensions.paddingSize12,
                ),
                CustomText(
                  text: 'omg.mohamed@gmail.com',
                  fontSize: Dimensions.fontSize14 + 2.sp,
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
                    onPressed: () {},
                    text: 'أسماء سالم غنام الشمري',
                    trailing: CustomSvgPicture(assetName: ICONS.setting),
                  ),
                )
              ],
            )),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
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
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: Dimensions.fontSize18 + 1.sp,
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

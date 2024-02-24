import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class WidgetDataUser extends StatelessWidget {
  final String? headerText;
  final Widget? tabBar;
  final Widget list;

  const WidgetDataUser(
      {super.key, this.headerText, this.tabBar, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: COLORS.primaryColor,
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios_sharp,
                size: 25,
                color: Colors.white,
                weight: 20,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: Dimensions.paddingSize12,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomText(
              text: headerText ?? '',
              fontSize: Dimensions.fontSize18 + 2,
              color: Colors.white,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w700,
              maxLine: 1,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: tabBar != null
                  ? Dimensions.paddingSize25 + 20
                  : Dimensions.paddingSize16,
            ),
          ),
          tabBar ?? SliverToBoxAdapter(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: tabBar != null
                  ? Dimensions.paddingSize25 + 20
                  : Dimensions.paddingSize16,
            ),
          ),
          list
          
        ],
      ),
    );
  }
}

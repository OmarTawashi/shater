import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/presentation/screens/base/custom_intike_container.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: COLORS.primaryColor,
            leadingWidth: 120.w,
            toolbarHeight: 65,
            leading: GestureDetector(
              onTap: () {},
              child: CustomIntikeContainer(
                paddingHorizontal: Dimensions.paddingSize12,
                child: CustomText(
                  text: 'cancel',
                  color: Colors.white,
                  fontSize: Dimensions.fontSize14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [
              CustomBorderText(
                horizontalPadding: Dimensions.paddingSize25,
                child: CustomText(
                  text: 'save',
                  color: COLORS.strokeColor,
                  fontSize: Dimensions.fontSize14,
                  fontWeight: FontWeight.bold,
                ),
                radius: 32,
              ),

            ],
          ),
          
        ],
      ),
    );
  }
}

class CustomBorderText extends StatelessWidget {
  final double? radius;
  final Widget? child;
  final double? horizontalPadding;
  const CustomBorderText({super.key,this.horizontalPadding, this.child, this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
        padding:  EdgeInsets.symmetric(
            horizontal:horizontalPadding ?? 16,
            vertical: Dimensions.paddingSize12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 8),
            border: Border.all(
              color: COLORS.strokeColor,
              width: 1.8,
            ),
            color: Colors.transparent),
        child: child);
  }
}

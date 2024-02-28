import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/auth/base%20login/controller/auth_controller.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

import '../../../util/images.dart';

class HtmlView extends StatelessWidget {
  final bool isPrivcy;

  const HtmlView({super.key, required this.isPrivcy});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
        leading: ButtonBack(),
        centerTitle: true,
        title: CustomText(
          text: isPrivcy ? 'privcy_policy' : 'terms_conditions',
          color: Colors.white,
          fontSize: Dimensions.fontSize15,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: GetBuilder<AuthController>(
        builder: (controller) => SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatorContainer(
              viewType: controller.viewType,
              isSliver: false,
              emptyParams: EmptyParams(
                text: 'empty school',
                caption: '',
                image: ICONS.internalServerError,
              ),
              successWidget:,
            ),
          ],
        )),
      ),
    );
  }
}

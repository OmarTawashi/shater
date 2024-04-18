import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/base%20questions/congrlate/controller/congrlate_controller.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:video_player/video_player.dart';

class CongrlateScreen extends StatelessWidget {
  const CongrlateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: COLORS.backGroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSize16),
        child: GetBuilder<QuestionController>(
          builder: (controller) => 
         Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: CupertinoButton(
                  child: CustomText(
                    text: 'next',
                    fontSize: Dimensions.fontSize16,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  borderRadius: BorderRadius.circular(80),
                  onPressed: () {
                    Get.back();
                   controller.getSecandQuestion();
                  },
                  color: COLORS.secanderyColor,
                  disabledColor: Color.fromRGBO(228, 228, 228, 1),
                ),
              ),
            ],
          ),
        ),
      ),
      body: GetBuilder<CongrlateController>(
        builder: (controller) => SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                  height: Get.height,
                  width: Get.width,
                  child: VideoPlayer(controller.videoController))
            ],
          ),
        ),
      ),
    );
  }
}

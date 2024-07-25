import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/teacher/Explanation/view/add_excercise/add_quastion_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/custom_textfield.dart';
import 'package:video_player/video_player.dart';

import '../../record_title_audio/record_title_audio_controller_.dart';

class SliderBiulder extends StatelessWidget {
  const SliderBiulder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddQuastionController>(
      builder: (controller) {
        return Stack(
          children: [
            SizedBox(
              height: 400.h,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    color: COLORS.textColor.withOpacity(0.2),
                    height: 233.h,
                    width: MediaQuery.sizeOf(context).width,
                    child: GestureDetector(
                      onTap: () => controller.showMediaPicker(context, true),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_a_photo_outlined,
                            color: COLORS.strokeColor,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "أضف صورة",
                            style: TextStyle(color: COLORS.textColor),
                          ),
                          controller.cropedFileimage != null
                              ? Expanded(
                                  child: Stack(
                                    children: [
                                      Image(
                                        image: FileImage(
                                          File(
                                              controller.cropedFileimage!.path),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundColor: COLORS.backGroundColor,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () =>
                                                controller.deleteImage(),
                                            icon: Icon(
                                              Icons.delete_forever_outlined,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    color: COLORS.textColor.withOpacity(0.2),
                    // height: 600.h,
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              controller.showMediaPicker(context, false),
                          child: Icon(
                            Icons.video_call_rounded,
                            color: COLORS.strokeColor,
                            size: 40,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "أضف فيديو",
                          style: TextStyle(color: COLORS.textColor),
                        ),
                        if (controller.videoFile != null)
                          controller.videoPlayerController != null &&
                                  controller.videoPlayerController!.value
                                      .isInitialized
                              ? Expanded(
                                  child: AspectRatio(
                                    aspectRatio: controller
                                        .videoPlayerController!
                                        .value
                                        .aspectRatio,
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        VideoPlayer(
                                            controller.videoPlayerController!),
                                        VideoProgressIndicator(
                                          controller.videoPlayerController!,
                                          allowScrubbing: true,
                                          colors: VideoProgressColors(
                                            playedColor: COLORS.primaryColor,
                                            bufferedColor: Colors.grey,
                                            backgroundColor: Colors.black,
                                          ),
                                        ),
                                        Center(
                                          child: IconButton(
                                              icon: Icon(
                                                controller.isPlaying
                                                    ? Icons.pause
                                                    : Icons.play_arrow,
                                                color: controller.isPlaying
                                                    ? Colors.white
                                                    : Colors.red,
                                                size: 50,
                                              ),
                                              onPressed: () =>
                                                  controller.playVideo()),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    alignment: Alignment.center,
                    color: COLORS.textColor.withOpacity(0.2),
                    height: 233.h,
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomeTextField(
                          textController: controller.descTextController,
                          keyboardType: TextInputType.text,
                          hintText: "أضف نص",
                          minLines: 3,
                          maxLines: 15,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "أضف نص",
                          style: TextStyle(color: COLORS.textColor),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    color: COLORS.textColor.withOpacity(0.2),
                    // height: 600.h,
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Get.find<RecordController>()
                              .showAudioPicker(
                                  context: context, istitle: false),
                          child: Icon(
                            Icons.video_call_rounded,
                            color: COLORS.strokeColor,
                            size: 40,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "أضف تسجيل صوت",
                          style: TextStyle(color: COLORS.textColor),
                        ),
                      ],
                    ),
                  ),
                ],
                onPageChanged: (value) => controller.changeCurrentIndex(value),
              ),
            ),
            Transform.translate(
              offset: Offset(0.w, 410.h),
              child: PageViewIndicator(
                otherSize: 5,
                currentSize: 8,
                length: 4,
                currentIndex: controller.currentIndex,
                currentColor: COLORS.primaryColor,
                otherColor: COLORS.strokeColor,
                animationDuration: const Duration(milliseconds: 200),
              ),
            ),
          ],
        );
      },
    );
  }
}

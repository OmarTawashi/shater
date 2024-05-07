import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/questions/lesson/controller/lesson_controller.dart';
import 'package:video_player/video_player.dart';

class LessonView extends StatelessWidget {
  const LessonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LessonController>(
      builder: (controller) => SizedBox(
        height: Get.height * 0.71,
        width: Get.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            FutureBuilder(
              future: controller.initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return VideoPlayer(controller.videoController);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            Center(
              child: IconButton(
                icon: Icon(
                  controller.videoController.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                  size: 40,
                ),
                onPressed: () {
                  controller.powerVideo();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

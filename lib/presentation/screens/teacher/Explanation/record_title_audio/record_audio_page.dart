import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/teacher/Explanation/record_title_audio/record_title_audio_controller_.dart';
import 'package:shater/util/color.dart';

class RecordPage extends StatelessWidget {
  final RecordController recordController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: COLORS.secanderyColor,
        // title: Text('Record Page'),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.check),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              "اضغط مع الاستمرار لتسجيل الصوت",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(
              () {
                if (recordController.isRecording.value) {
                  return Text(
                    'مدة التسجيل: ${recordController.getFormattedDuration()}',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  );
                } else if (recordController.titleAudioDuration.value.isNotEmpty) {
                  return Text(
                    '${recordController.titleAudioDuration.value}',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  );
                } else {
                  return Text(
                    'لم يتم ارفاق الملف بعد',
                    style: TextStyle(fontSize: 14.sp),
                    textAlign: TextAlign.center,
                  );
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            // Obx(
            //   () => Text(
            //     recordController.fileName.value.isEmpty
            //         ? 'No file selected'
            //         : 'File: ${recordController.fileName.value}',
            //     style: TextStyle(fontSize: 16),
            //   ),
            // ),
            // ElevatedButton(
            //   onPressed: () async {
            //     await recordController.deleteFile();
            //   },
            //   child: Text('Delete File'),
            // ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 50.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () => recordController.playRecording(),
                    icon: Icon(
                      Icons.play_arrow,
                      color: COLORS.primaryColor,
                      size: 50,
                    ),
                  ),
                  GestureDetector(
                    onLongPress: () => recordController.startRecording(istitle: true),
                    child: Icon(
                      Icons.circle,
                      color: COLORS.errorColor,
                      size: 70,
                    ),
                  ),
                  IconButton(
                    onPressed: () => recordController.stopRecording(),
                    icon: Icon(
                      Icons.square,
                      color: COLORS.primaryColor,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),

            // ElevatedButton(
            //   onPressed: () async {
            //     await recordController.startRecording();
            //   },
            //   child: Text('Start Recording'),
            // ),
            // ElevatedButton(
            //   onPressed: () async {
            //     await recordController.stopRecording();
            //   },
            //   child: Text('Stop Recording'),
            // ),
            // ElevatedButton(
            //   onPressed: () async {
            //     await recordController.playRecording();
            //   },
            //   child: Text('Play Recording'),
            // ),
            // ElevatedButton(
            //   onPressed: () async {
            //     await recordController.pickAudioFile();
            //   },
            //   child: Text('Pick Audio File'),
            // ),
            // ElevatedButton(
            //   onPressed: () async {
            //     await recordController.stopPlayback();
            //   },
            //   child: Text('Stop Playback'),
            // ),
            // ElevatedButton(
            //   onPressed: () async {
            //     await recordController.deleteFile();
            //   },
            //   child: Text('Delete File'),
            // ),
          ],
        ),
      ),
    );
  }
}

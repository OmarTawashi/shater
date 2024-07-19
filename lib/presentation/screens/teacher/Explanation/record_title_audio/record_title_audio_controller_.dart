import 'dart:async';
import 'dart:io';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';
import 'package:shater/presentation/screens/teacher/Explanation/record_title_audio/record_audio_page.dart';
import 'package:shater/presentation/screens/teacher/Explanation/view/add_excercise/add_quastion_controller.dart';
import 'package:shater/util/color.dart';

class RecordController extends GetxController {
  AddQuastionController addQuastionController =
      Get.find<AddQuastionController>();
  final record = AudioRecorder();
  final audioPlayer = AudioPlayer();
  String? titleAudiofilePath;
  String? quastionAudiofilePath;

  var isRecording = false.obs;
  var recordingDuration = 0.obs;
  Timer? _timer;
  DateTime? _startTime;
  var titlefileName = ''.obs;
  var quastionfileName = ''.obs;
  var quastionAudioDuration = ''.obs;
  var titleAudioDuration = ''.obs;

  Future<void> startRecording({required bool istitle}) async {
    if (await Permission.microphone.request().isGranted) {
      final directory = await getApplicationDocumentsDirectory();
      if (istitle) {
        titleAudiofilePath = '${directory.path}/recording.m4a';
        titlefileName.value = 'recording.m4a';
        await record.start(const RecordConfig(), path: titleAudiofilePath!);
      } else {
        quastionAudiofilePath = '${directory.path}/recording.m4a';
        quastionfileName.value = 'recording.m4a';
        await record.start(const RecordConfig(), path: quastionAudiofilePath!);
      }

      isRecording.value = true;
      _startTime = DateTime.now();

      _startTimer();
    }
    update();
  }

  Future<void> stopPlayback() async {
    await audioPlayer.stop();
  }

  Future<void> pickAudioFile({required bool isTitleAudio}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );
    if (result != null && result.files.single.path != null) {
      if (isTitleAudio) {
        titleAudiofilePath = result.files.single.path;
        titlefileName.value = result.files.single.name;
        await audioPlayer.setFilePath(titleAudiofilePath!);
        await audioPlayer.load(); // Load the audio to get its duration
        // Get.find<AddQuastionController>().getQuestionMediaFile(mediaType);
        final duration = await audioPlayer.duration;
        titleAudioDuration.value = _formatDuration(duration);
      } else {
        quastionAudiofilePath = result.files.single.path;
        quastionfileName.value = result.files.single.name;
        await audioPlayer.setFilePath(quastionAudiofilePath!);
        await audioPlayer.load(); // Load the audio to get its duration
        // Get.find<AddQuastionController>().getQuestionMediaFile(mediaType);
        final duration = await audioPlayer.duration;
        quastionAudioDuration.value = _formatDuration(duration);
      }
      addQuastionController.updateTitleHasAudio(
          hasAudiaudioFile: true, audioFile: result.files.single);
      update();
    }
  }

  Future<void> deleteFile({required bool isTitle} ) async {
    if(isTitle){
  if (titleAudiofilePath != null ) {
      File(titleAudiofilePath!).delete();
      titleAudiofilePath = null;
      titlefileName.value = '';
      titleAudioDuration.value = '';
      addQuastionController.updateTitleHasAudio(
          hasAudiaudioFile: false, audioFile: null);
      update();
    }
    }else{
  if (quastionAudiofilePath != null ) {
      File(quastionAudiofilePath!).delete();
      quastionAudiofilePath = null;
      quastionfileName.value = '';
      quastionAudioDuration.value = '';
      // addQuastionController.updateTitleHasAudio(
      //     hasAudiaudioFile: false, audioFile: null);
      update();
    }
    }
  
  }

  String getFormattedDuration() {
    final duration = Duration(milliseconds: recordingDuration.value);
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    final milliseconds =
        (duration.inMilliseconds.remainder(1000) ~/ 100).toString();
    return '$minutes:$seconds.$milliseconds';
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      final now = DateTime.now();
      final duration = now.difference(_startTime!);
      recordingDuration.value = duration.inMilliseconds;
    });
  }

  Future<void> stopRecording() async {
    await record.stop();
    isRecording.value = false;
    _timer?.cancel();
    recordingDuration.value = 0;
  }

  Future<void> playRecording() async {
    if (titleAudiofilePath != null) {
      await audioPlayer.setFilePath(titleAudiofilePath!);
      await audioPlayer.load(); // Load the audio to get its duration
      final duration = await audioPlayer.duration;
      titleAudioDuration.value = _formatDuration(duration);
      audioPlayer.play();
    }
  }

  Future<void> extractAudioFromVideo(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );
    if (result != null && result.files.single.path != null) {
      final videoPath = result.files.single.path;
      final directory = await getApplicationDocumentsDirectory();
      titleAudiofilePath = '${directory.path}/extracted_audio.m4a';
      titlefileName.value = 'extracted_audio.m4a';

      await FFmpegKit.execute('-i $videoPath -q:a 0 -map a $titleAudiofilePath')
          .then(
        (session) async {
          final returnCode = await session.getReturnCode();
          if (returnCode!.isValueSuccess()) {
            await audioPlayer.setFilePath(titleAudiofilePath!);
            await audioPlayer.load();
            final duration = await audioPlayer.duration;
            titleAudioDuration.value = _formatDuration(duration);
            debugPrint(
                "////////////////////////////////////////////////////////");

            _showAudioFileDialog(context, result.files.single.name);
            debugPrint(
                "////////////////////////${result.files.single.name}////////////////////////////////");
            playExtractedAudio();
          } else {
            titleAudiofilePath = null;
            titlefileName.value = '';
            titleAudioDuration.value = '';
          }
        },
      );
    }
  }

  Future<void> playExtractedAudio() async {
    if (titleAudiofilePath != null) {
      await audioPlayer.setFilePath(titleAudiofilePath!);
      await audioPlayer.load();
      final duration = await audioPlayer.duration;
      titleAudioDuration.value = _formatDuration(duration);
      audioPlayer.play();
    }
  }

  String _formatDuration(Duration? duration) {
    if (duration == null) return '';
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _showAudioFileDialog(BuildContext context, String fileName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Audio Extracted'),
          content: Text('File: $fileName'),
          actions: [
            TextButton(
              onPressed: () async {
                await playRecording();
              },
              child: Text('Play'),
            ),
            TextButton(
              onPressed: () async {
                await stopPlayback();
              },
              child: Text('Stop'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void showAudioPicker(
      {required BuildContext context, required bool istitle}) async {
    // await requestPermissions();
    showModalBottomSheet(
      enableDrag: false,
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                Text(
                  ' اضافة ملف \n اختر نوع الملف لاضافته ',
                  style: TextStyle(color: COLORS.hintColor),
                  textAlign: TextAlign.center,
                ),
                Divider(
                  color: COLORS.dividerColor,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    pickAudioFile(isTitleAudio: istitle);
                  },
                  child: Text(
                    "ملف",
                    style: TextStyle(
                        color: COLORS.secanderyColor, fontSize: 20.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  color: COLORS.dividerColor,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    extractAudioFromVideo(context);
                  },
                  child: Text(
                    "فيديو",
                    style: TextStyle(
                        color: COLORS.secanderyColor, fontSize: 20.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  color: COLORS.dividerColor,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.to(
                      () => RecordPage(),
                    );
                  },
                  child: Text(
                    "تسجيل",
                    style: TextStyle(
                        color: COLORS.secanderyColor, fontSize: 20.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  color: COLORS.dividerColor,
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Text(
                    "الغاء",
                    style: TextStyle(
                        color: COLORS.secanderyColor, fontSize: 20.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  color: COLORS.dividerColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

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
import 'package:shater/util/color.dart';

class RecordController extends GetxController {
  final record = AudioRecorder();
  final audioPlayer = AudioPlayer();
  String? filePath;
  var isRecording = false.obs;
  var recordingDuration = 0.obs;
  Timer? _timer;
  DateTime? _startTime;
  var fileName = ''.obs;
  var audioDuration = ''.obs;

  Future<void> startRecording() async {
    if (await Permission.microphone.request().isGranted) {
      final directory = await getApplicationDocumentsDirectory();
      filePath = '${directory.path}/recording.m4a';
      fileName.value = 'recording.m4a';
      await record.start(const RecordConfig(), path: filePath!);
      isRecording.value = true;
      _startTime = DateTime.now();

      _startTimer();
    }
    update();
  }

  Future<void> stopPlayback() async {
    await audioPlayer.stop();
  }

  Future<void> pickAudioFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );
    if (result != null && result.files.single.path != null) {
      filePath = result.files.single.path;
      fileName.value = result.files.single.name;
      await audioPlayer.setFilePath(filePath!);
      await audioPlayer.load(); // Load the audio to get its duration
      final duration = await audioPlayer.duration;
      audioDuration.value = _formatDuration(duration);
      update();
    }
  }

  Future<void> deleteFile() async {
    if (filePath != null) {
      File(filePath!).delete();
      filePath = null;
      fileName.value = '';
      audioDuration.value = '';
      update();
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
    if (filePath != null) {
      await audioPlayer.setFilePath(filePath!);
      await audioPlayer.load(); // Load the audio to get its duration
      final duration = await audioPlayer.duration;
      audioDuration.value = _formatDuration(duration);
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
      filePath = '${directory.path}/extracted_audio.m4a';
      fileName.value = 'extracted_audio.m4a';

      await FFmpegKit.execute('-i $videoPath -q:a 0 -map a $filePath').then(
        (session) async {
          final returnCode = await session.getReturnCode();
          if (returnCode!.isValueSuccess()) {
            await audioPlayer.setFilePath(filePath!);
            await audioPlayer.load();
            final duration = await audioPlayer.duration;
            audioDuration.value = _formatDuration(duration);
            debugPrint(
                "////////////////////////////////////////////////////////");

            _showAudioFileDialog(context, result.files.single.name);
            debugPrint(
                "////////////////////////${result.files.single.name}////////////////////////////////");

            playExtractedAudio();
          } else {
            filePath = null;
            fileName.value = '';
            audioDuration.value = '';
          }
        },
      );
    }
  }

  Future<void> playExtractedAudio() async {
    if (filePath != null) {
      await audioPlayer.setFilePath(filePath!);
      await audioPlayer.load();
      final duration = await audioPlayer.duration;
      audioDuration.value = _formatDuration(duration);
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

  void showPicker(BuildContext context) async {
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
                    pickAudioFile();
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

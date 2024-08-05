import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../teacher_explanation_controller.dart';

class cameraWidget extends StatelessWidget {
  cameraWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherExplanationController>(builder: (controller) {
      return CameraPreview(controller.camera_Controller);
    });
  }
}

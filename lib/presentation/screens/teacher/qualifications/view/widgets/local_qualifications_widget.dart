import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/presentation/screens/teacher/qualifications/view/widgets/remote_qualifications_widget.dart';

import '../../../../base/custom_text_form_field.dart';
import '../../controller/qualifications_controller.dart';
import '../qualifications_screen.dart';

class LocalQualificationsWidget extends StatelessWidget {
  const LocalQualificationsWidget({
    super.key,
    required this.i,
    required this.controller,
    required this.type,
  });

  final int i;
  final QualificationsController controller;
  final QualificationsType type;

  @override
  Widget build(BuildContext context) {
    bool isCourse = type == QualificationsType.course;
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            hintText: 'اسم الشهادة',
            controller: isCourse ? controller.localCourses[i].textEditingController : controller.localCertificates[i].textEditingController,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value){
              if(isCourse){
                controller.isCoursesEnable();

              }else{
                controller.isCertificatesEnable();
              }
              controller.update();
            },
            prefix: GestureDetector(
              onTap: () {
                if(isCourse){
                  controller.deleteCourse(controller.localCourses[i]);
                }else{
                  controller.deleteQualification(controller.localCertificates[i]);
                }
              },
              child: Icon(
                Icons.clear,
                color: Colors.white.withOpacity(0.5),
                size: 25.sp,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        IconButtonWidget(
          iconData: Icons.file_download_outlined,
          onTap: () {
            if(isCourse){
              if (controller.localCourses[i].file == null) {
                controller.selectFileFromDevice(i);
              }
            }else{
              if (controller.localCertificates[i].file == null) {
                controller.selectFileFromDevice(i);
              }
            }
          },
        ),
      ],
    );
  }
}
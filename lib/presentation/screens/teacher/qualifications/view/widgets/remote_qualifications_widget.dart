import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../base/custom_text_form_field.dart';
import '../../controller/qualifications_controller.dart';
import '../qualifications_screen.dart';

class RemoteQualificationsWidget extends StatelessWidget {
  const RemoteQualificationsWidget({
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
            enabledField: false,
            controller: isCourse ? controller.remoteCourses[i].textEditingController : controller.remoteCertificates[i].textEditingController,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        IconButtonWidget(
          iconData: Icons.more_vert,
          onTap: () {},
        ),
      ],
    );
  }
}

enum QualificationsType {
  certificate,
  course,
}

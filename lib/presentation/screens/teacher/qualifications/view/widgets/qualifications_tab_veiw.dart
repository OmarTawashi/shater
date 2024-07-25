import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/teacher/qualifications/controller/qualifications_controller.dart';
import 'package:shater/presentation/screens/teacher/qualifications/view/widgets/local_qualifications_widget.dart';
import 'package:shater/presentation/screens/teacher/qualifications/view/widgets/remote_qualifications_widget.dart';

class QualificationsTabView extends StatelessWidget {
  const QualificationsTabView({
    super.key,
    required this.type,
  });

  final QualificationsType type;

  @override
  Widget build(BuildContext context) {
    bool isCourse = type == QualificationsType.course;
    return GetBuilder<QualificationsController>(builder: (controller) {
      return Column(
        children: [
          ListView.separated(
            itemCount: isCourse ? controller.remoteCourses.length: controller.remoteCertificates.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return RemoteQualificationsWidget(
                controller: controller,
                i: i,
                type: type,
              );
            },
            separatorBuilder: (context, i) {
              return SizedBox(
                height: 15.h,
              );
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          ListView.separated(
            itemCount: isCourse ? controller.localCourses.length: controller.localCertificates.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return LocalQualificationsWidget(
                controller: controller,
                i: i,
                type: type,
              );
            },
            separatorBuilder: (context, i) {
              return SizedBox(
                height: 15.h,
              );
            },
          ),
        ],
      );
    });
  }
}

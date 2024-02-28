import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/data/model/subject_model.dart';
import 'package:shater/presentation/screens/auth/sign%20up/controller/sign_up_controller.dart';
import 'package:shater/presentation/screens/auth/sign%20up/widgets/item_city.dart';
import 'package:shater/presentation/screens/subject%20teacher/controller/subject_techer_controller.dart';

import '../../../../routes/app_routes.dart';
import '../../../../util/images.dart';
import '../../auth/sign up/widgets/widget_data_user.dart';
import '../../base/animator_container.dart';

class SubjectTeacherScreen extends StatelessWidget {
  const SubjectTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubjectTeacherController>(
      builder: (controller) => WidgetDataUser(
          headerText: 'select_subject',
          list: AnimatorContainer(
            viewType: controller.viewType,
            isSliver: true,
            emptyParams: EmptyParams(
                text: 'empty subject',
                caption: '',
                image: ICONS.internalServerError),
            successWidget: listSubject(controller),
            retry: () {
              controller.fetchSubject();
            },
          )),
    );
  }

  SliverList listSubject(SubjectTeacherController controller) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: controller.subjects.length,
        (context, index) => ItemCity(
          name: controller.subjects[index].title,
          onTap: () {
            Subject? subject = controller.subjects[index];
            Get.find<SignUpController>().setSubject(subject);
            if (Get.find<SignUpController>().subjectSlected != null) {
              Get.toNamed(Routes.getCityScreen());
            } else {
              BaseMixin.showToastFlutter(messsage: 'select_subject');
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/intike_tab_bar.dart';
import 'package:shater/presentation/screens/base/tap_section.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/dashBord/controller/dashboard_controller.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/contact/view/contact_screen.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/controller/exercise_contact_controller.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/exercises/view/exercise_teacher_widget.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/notification/view/notification_screen.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/notification/widgets/notify_app_bar.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class ExerciseContactScreen extends StatelessWidget {
  const ExerciseContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NotifyAppBar(),
        body: GetBuilder<ExerciseContactController>(
          builder: (controller) => CustomScrollView(
            slivers: [
              IntikeTapBar(
                assetName: ICONS.contactTop,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TapSection(
                      isSelected:
                          (controller.selectContact == TabContact.contacts),
                      onTap: () {
                        controller.changeSection(TabContact.contacts);
                      },
                      text: TabContact.contacts.name.tr,
                    ),
                    TapSection(
                      isSelected: (controller.selectContact ==
                          TabContact.exerciedTeachers),
                      onTap: () {
                        controller.changeSection(TabContact.exerciedTeachers);
                      },
                      text: TabContact.exerciedTeachers.name.tr,
                    ),
                  ],
                ),
              ),
              selectable(controller),
              SliverToBoxAdapter(
                  child: SizedBox(
                height: 100.h,
              )),
            ],
          ),
        ));
  }

  Widget selectable(ExerciseContactController controller) {
    switch (controller.selectContact) {
      case TabContact.contacts:
        return getContactWidget();
      case TabContact.exerciedTeachers:
        return getEXerciseTeacherWidget();
      default:
        return getContactWidget();
    }
  }

  Widget getContactWidget() {
    return ContactScreen();
  }

  Widget getEXerciseTeacherWidget() {
    return ExerciseTeacherWidget();
  }
}

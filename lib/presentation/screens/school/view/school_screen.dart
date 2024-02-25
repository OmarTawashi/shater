import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/auth/sign%20up/widgets/widget_data_user.dart';
import 'package:shater/presentation/screens/base/section_header_delegate.dart';
import 'package:shater/presentation/screens/school/controller/school_controller.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/color.dart';

import '../../../../core/base/base_mixin.dart';
import '../../../../util/images.dart';
import '../../auth/sign up/controller/sign_up_controller.dart';
import '../../auth/sign up/widgets/item_city.dart';
import '../../base/animator_container.dart';
import '../../base/tap_section.dart';

class SchoolScreen extends StatelessWidget {
  const SchoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SchoolController>(
      builder: (controller) => WidgetDataUser(
          headerText: 'select_school',
          tabBar: SliverPersistentHeader(
              delegate: SectionHeaderDelegate(
                  height: 55,
                  widget: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: COLORS.secanderyColor,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: Row(
                      children: [
                        TapSection(
                          selectColor: COLORS.primaryColor,
                          isSelected: (controller.selectSchoolGender ==
                              SchoolGender.male),
                          onTap: () {
                            controller.changeSchoolGender(SchoolGender.male);
                            controller.getSchools();
                          },
                          text: SchoolGender.male.name.tr,
                        ),
                        TapSection(
                          selectColor: COLORS.primaryColor,
                          isSelected: (controller.selectSchoolGender ==
                              SchoolGender.female),
                          onTap: () {
                            controller.changeSchoolGender(SchoolGender.female);
                            controller.getSchools();
                          },
                          text: SchoolGender.female.name.tr,
                        ),
                      ],
                    ),
                  ))),
          list: AnimatorContainer(
            viewType: controller.viewType,
            isSliver: true,
            emptyParams: EmptyParams(
                text: 'empty school',
                caption: '',
                image: ICONS.internalServerError),
            successWidget: listCity(controller),
            retry: () {
              controller.getSchools();
            },
          )),
    );
  }
}

SliverList listCity(SchoolController controller) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      childCount: controller.schools.length,
      (context, index) => ItemCity(
        name: controller.schools[index].name,
        onTap: () {
          final school = controller.schools[index];
          Get.find<SignUpController>().setSchool(school);
          if (Get.find<SignUpController>().schoolSelected != null) {
            Get.toNamed(Routes.getLevelScreen());
          } else {
            BaseMixin.showToastFlutter(messsage: 'please_select_school');
          }
        },
      ),
    ),
  );
}

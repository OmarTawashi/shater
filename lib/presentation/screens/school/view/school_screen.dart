import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/add%20child/controller/add_child_controller.dart';
import 'package:shater/presentation/screens/auth/sign%20up/widgets/widget_data_user.dart';
import 'package:shater/presentation/screens/base/section_header_delegate.dart';
import 'package:shater/presentation/screens/edit%20profile/controller/edit_profile_controller.dart';
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
  const SchoolScreen({super.key, required this.typeFrom});

  final int typeFrom;
  // typeFrom : 0 => from signup || typeFrom : => 1 from add child || typeFrom : => 2 from edit profile

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
                            controller.getSchools(typeFrom);
                          },
                          text: SchoolGender.male.name.tr,
                        ),
                        TapSection(
                          selectColor: COLORS.primaryColor,
                          isSelected: (controller.selectSchoolGender ==
                              SchoolGender.female),
                          onTap: () {
                            controller.changeSchoolGender(SchoolGender.female);
                            controller.getSchools(typeFrom);
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
            successWidget: listCity(controller,typeFrom),
            retry: () {
              controller.getSchools(typeFrom);
            },
          )),
    );
  }
}

SliverList listCity(SchoolController controller , int typeFrom) {
  // typeFrom : 0 => from signup || typeFrom : => 1 from add child
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      childCount: controller.schools.length,
      (context, index) => ItemCity(
        name: controller.schools[index].name,
        onTap: () {
          final school = controller.schools[index];
          if(typeFrom == 0){
            Get.find<SignUpController>().setSchool(school);
            if (Get.find<SignUpController>().schoolSelected != null) {
              Get.toNamed(Routes.getClasseScreen());
            } else {
              BaseMixin.showToastFlutter(messsage: 'please_select_school');
            }
          }else if(typeFrom == 1){
            Get.find<AddChildController>().setSchool(school);
            if (Get.find<AddChildController>().schoolSelected != null) {
              Get.back();
            } else {
              BaseMixin.showToastFlutter(messsage: 'please_select_school');
            }
          }else{
            Get.find<EditProfileController>().setSchool(school);
            if (Get.find<EditProfileController>().schoolSelected != null) {
              Get.back();
            } else {
              BaseMixin.showToastFlutter(messsage: 'please_select_school');
            }
          }

        },
      ),
    ),
  );
}

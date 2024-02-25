import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/data/model/class_model.dart';
import 'package:shater/presentation/screens/auth/sign%20up/widgets/item_city.dart';
import 'package:shater/presentation/screens/auth/sign%20up/widgets/widget_data_user.dart';
import 'package:shater/presentation/screens/level/controller/level_controller.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/images.dart';

import '../../../../core/base/base_mixin.dart';
import '../../auth/sign up/controller/sign_up_controller.dart';
import '../../base/animator_container.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeveController>(
      builder: (controller) => WidgetDataUser(
          headerText: 'select_level_study',
          list: AnimatorContainer(
            viewType: controller.viewType,
            isSliver: true,
            emptyParams: EmptyParams(
                text: 'empty Level',
                caption: '',
                image: ICONS.internalServerError),
            successWidget: listLevel(controller),
            retry: () {
              controller.getLevel();
            },
          )),
    );
  }

  SliverList listLevel(LeveController controller) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: controller.classes?.country?.first.classes?.length,
        (context, index) => ItemCity(
          name: controller.classes?.country?.first.classes?[index].title,
          onTap: () {
            Classes? classes =
                controller.classes?.country?.first.classes?[index];
            Get.find<SignUpController>().setClass(classes!);
            if (Get.find<SignUpController>().citySelected != null) {
               Get.toNamed(Routes.getCreateNameScreen());
              print('object');
            } else {
              BaseMixin.showToastFlutter(messsage: 'please_select_class');
            }
          },
        ),
      ),
    );
  }
}/*ItemCity(
          name: 'الصف الاول',
          onTap: () {
            Get.toNamed(Routes.getCreateNameScreen());
          },
        )*/

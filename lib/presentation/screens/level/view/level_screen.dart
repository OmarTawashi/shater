import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/auth/sign%20up/widgets/item_city.dart';
import 'package:shater/presentation/screens/auth/sign%20up/widgets/widget_data_user.dart';
import 'package:shater/presentation/screens/level/controller/level_controller.dart';
import 'package:shater/util/images.dart';

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
                text: 'empty city',
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
        childCount: controller.levels.length,
        (context, index) => ItemCity(
          name: controller.levels[index].name,
          onTap: () {
            // final city = controller.cities[index];
            // Get.find<SignUpController>().setCity(city);
            // if (Get.find<SignUpController>().citySelected !=null) {
            //    Get.toNamed(Routes.getSchoolScreen());
            // }else{
            //   BaseMixin.showToastFlutter(
            //     messsage: 'please_select_city'
            //   );
            // }
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

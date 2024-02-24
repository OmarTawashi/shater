import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/presentation/screens/auth/sign%20up/controller/sign_up_controller.dart';
import 'package:shater/presentation/screens/auth/sign%20up/widgets/item_city.dart';
import 'package:shater/presentation/screens/auth/sign%20up/widgets/widget_data_user.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/city/controller/city_controller.dart';
import 'package:shater/util/images.dart';

import '../../../../routes/app_routes.dart';

class cityScreen extends StatelessWidget {
  const cityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CityController>(
      builder: (controller) => WidgetDataUser(
        headerText: 'select_city',
        list: AnimatorContainer(
          viewType: controller.viewType,
          isSliver: true,
          emptyParams: EmptyParams(
              text: 'empty city',
              caption: '',
              image: ICONS.internalServerError),
          successWidget: listCity(controller),
          retry: () {
            controller.getCities();
          },
        ),
      ),
    );
  }

  SliverList listCity(CityController controller) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: controller.cities.length,
        (context, index) => ItemCity(
          name: controller.cities[index].name,
          onTap: () {
            final city = controller.cities[index];
            Get.find<SignUpController>().setCity(city);
            if (Get.find<SignUpController>().citySelected !=null) {
               Get.toNamed(Routes.getSchoolScreen());
            }else{
              BaseMixin.showToastFlutter(
                messsage: 'please_select_city'
              );
            }
           
          },
        ),
      ),
    );
  }
}

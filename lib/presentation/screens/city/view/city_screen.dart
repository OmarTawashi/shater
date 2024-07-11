import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/presentation/screens/add%20child/controller/add_child_controller.dart';
import 'package:shater/presentation/screens/auth/sign%20up/controller/sign_up_controller.dart';
import 'package:shater/presentation/screens/auth/sign%20up/widgets/item_city.dart';
import 'package:shater/presentation/screens/auth/sign%20up/widgets/widget_data_user.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/city/controller/city_controller.dart';
import 'package:shater/util/images.dart';

import '../../../../routes/app_routes.dart';
import '../../edit profile/controller/edit_profile_controller.dart';

class cityScreen extends StatelessWidget {
  const cityScreen({super.key, required this.typeFrom});

  final int typeFrom;
  // typeFrom : 0 => from signup || typeFrom : => 1 from add child || typeFrom : => 2 from edit profile

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
          successWidget: listCity(controller,typeFrom),
          retry: () {
            controller.getCities();
          },
        ),
      ),
    );
  }

  SliverList listCity(CityController controller , int typeFrom) {
    // typeFrom : 0 => from signup || typeFrom : => 1 from add child
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: controller.cities.length,
        (context, index) => ItemCity(
          name: controller.cities[index].name,
          onTap: () {
            final city = controller.cities[index];
            if(typeFrom == 0){
              Get.find<SignUpController>().setCity(city);
              if (Get.find<SignUpController>().citySelected !=null) {
                Get.toNamed(Routes.getSchoolScreen());
              }else{
                BaseMixin.showToastFlutter(
                    messsage: 'please_select_city'
                );
              }
            }else if(typeFrom == 1){
              Get.find<AddChildController>().setCity(city);
              if (Get.find<AddChildController>().citySelected !=null) {
                Get.back();
              }else{
                BaseMixin.showToastFlutter(
                    messsage: 'please_select_city'
                );
              }
            }else{
              Get.find<EditProfileController>().setCity(city);
              if (Get.find<EditProfileController>().citySelected !=null) {
                Get.back();
              }else{
                BaseMixin.showToastFlutter(
                    messsage: 'please_select_city'
                );
              }
            }

           
          },
        ),
      ),
    );
  }
}

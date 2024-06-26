import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/data/model/class_model.dart';
import 'package:shater/presentation/screens/auth/base%20login/controller/auth_controller.dart';
import 'package:shater/presentation/screens/auth/sign%20up/widgets/item_city.dart';
import 'package:shater/presentation/screens/auth/sign%20up/widgets/widget_data_user.dart';
import 'package:shater/presentation/screens/base/button_bottom.dart';
import 'package:shater/presentation/screens/classe/controller/classe_controller.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/images.dart';

import '../../auth/sign up/controller/sign_up_controller.dart';
import '../../base/animator_container.dart';

class ClasseScreen extends StatelessWidget {
  const ClasseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          Get.find<AuthController>().userType == AuthType.teacher
              ? ButtonBottom(
                  onTap: () {
                    goRoutes();
                  },
                )
              : SizedBox(),
      body: GetBuilder<ClasseController>(
        builder: (controller) => WidgetDataUser(
            headerText: 'select_level_study',
            list: AnimatorContainer(
              viewType: controller.viewType,
              isSliver: true,
              emptyParams: EmptyParams(
                  text: 'empty Level',
                  caption: '',
                  image: ICONS.internalServerError),
              successWidget: ListClass(controller),
              retry: () {
                controller.getClassesStudent();
              },
            )),
      ),
    );
  }

  SliverToBoxAdapter ListClass(ClasseController classeController) {
    return SliverToBoxAdapter(
        child: Column(
      // alignment: Alignment.bottomCenter,
      children: [
        GetBuilder<SignUpController>(
          builder: (controller) => 
           ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: classeController.classes.length,
            itemBuilder: (context, index) => ItemCity(
              name: classeController.classes[index].title,
              isSelect: Get.find<AuthController>().userType == AuthType.teacher &&
                  Get.find<SignUpController>()
                      .classSelected
                      .contains(classeController.classes[index]),
              onTap: () {
                Classes? classes = classeController.classes[index];
                if (Get.find<AuthController>().userType == AuthType.student) {
                  Get.find<SignUpController>().setClassStud(classes);
                  Get.toNamed(Routes.getCreateNameScreen());
                } else {
                  Get.find<SignUpController>().setClasses(classes);
                }
              },
            ),
          ),
        ),
      ],
    ));
  }

  void goRoutes() {
    if (Get.find<SignUpController>().classSelected != null &&
        Get.find<SignUpController>().classSelected.isNotEmpty) {
      Get.toNamed(Routes.getCreateNameScreen());
      print('object');
    } else {
      BaseMixin.showToastFlutter(messsage: 'please_select_class');
    }
  }
}

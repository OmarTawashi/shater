import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/data/model/class_model.dart';
import 'package:shater/presentation/screens/add%20child/controller/add_child_controller.dart';
import 'package:shater/presentation/screens/auth/base%20login/controller/auth_controller.dart';
import 'package:shater/presentation/screens/auth/sign%20up/widgets/item_city.dart';
import 'package:shater/presentation/screens/auth/sign%20up/widgets/widget_data_user.dart';
import 'package:shater/presentation/screens/base/button_bottom.dart';
import 'package:shater/presentation/screens/classe/controller/classe_controller.dart';
import 'package:shater/presentation/screens/edit%20profile/controller/edit_profile_controller.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/images.dart';

import '../../../../util/color.dart';
import '../../../../util/dimensions.dart';
import '../../auth/sign up/controller/sign_up_controller.dart';
import '../../base/animator_container.dart';
import '../../base/text_custom.dart';

class ClasseScreen extends StatelessWidget {
  const ClasseScreen({super.key, required this.typeFrom});

  final int typeFrom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      bottomNavigationBar:
          typeFrom == 0 ? Get.find<AuthController>().userType == AuthType.teacher
              ? ButtonBottom(
                  onTap: () {
                    goRoutes();
                  },
                )
              : SizedBox() : SizedBox(),
      body: GetBuilder<ClasseController>(
        builder: (controller){
          return CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: COLORS.primaryColor,
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 25,
                    color: Colors.white,
                    weight: 20,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: Dimensions.paddingSize12,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomText(
                  text: "select_level_study".tr,
                  fontSize: Dimensions.fontSize18 + 2,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  maxLine: 1,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: Dimensions.paddingSize16,
                ),
              ),
              SliverToBoxAdapter(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.classes.length,
                  itemBuilder: (context , i){
                    return ItemCity(
                      name: controller.classes[i].title,
                      isSelect: typeFrom == 0 ? (Get.find<AuthController>().userType == AuthType.teacher &&
                          Get.find<SignUpController>()
                              .classSelected
                              .contains(controller.classes[i])) : typeFrom == 1 ? Get.find<AddChildController>()
                          .classSelected
                          .contains(controller.classes[i]): Get.find<EditProfileController>()
                          .classSelected
                          .contains(controller.classes[i]),
                      onTap: () {
                        Classes? classes = controller.classes[i];
                        if(typeFrom == 0){
                          if (Get.find<AuthController>().userType == AuthType.student) {
                            Get.find<SignUpController>().setClassStud(classes);
                            Get.toNamed(Routes.getCreateNameScreen());
                          } else {
                            Get.find<SignUpController>().setClasses(classes);
                          }
                        }else if(typeFrom == 1){
                          Get.find<AddChildController>().setClassStud(classes);
                          Get.back();
                        }else {
                          Get.find<EditProfileController>().setClassStud(classes);
                          Get.back();
                        }
                      },
                    );
                    // return Container(
                    //   width: 300,
                    //   height: 50,
                    //   child: Text("${controller.classes[i].title}"),
                    // );
                  },
                ),
              ),
            ],
          );
          // return WidgetDataUser(
          //     headerText: 'select_level_study',
          //     list: AnimatorContainer(
          //       viewType: controller.viewType,
          //       isSliver: true,
          //       emptyParams: EmptyParams(
          //           text: 'empty Level',
          //           caption: '',
          //           image: ICONS.internalServerError),
          //       successWidget: ListClass(controller,typeFrom),
          //       retry: () {
          //         controller.getClassesStudent(typeFrom);
          //       },
          //     ));
        },
      ),
    );
  }

  SliverToBoxAdapter ListClass(ClasseController classeController , int typeFrom) {
    return SliverToBoxAdapter(
        child: GetBuilder<SignUpController>(
          builder: (controller){
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: classeController.classes.length,
              itemBuilder: (context, index){
                return ItemCity(
                  name: classeController.classes[index].title,
                  isSelect: typeFrom == 0 ? (Get.find<AuthController>().userType == AuthType.teacher &&
                      Get.find<SignUpController>()
                          .classSelected
                          .contains(classeController.classes[index])) : typeFrom == 1 ? Get.find<AddChildController>()
                      .classSelected
                      .contains(classeController.classes[index]) : Get.find<EditProfileController>()
                      .classSelected
                      .contains(classeController.classes[index]),
                  onTap: () {
                    Classes? classes = classeController.classes[index];
                    if(typeFrom == 0){
                      if (Get.find<AuthController>().userType == AuthType.student) {
                        Get.find<SignUpController>().setClassStud(classes);
                        Get.toNamed(Routes.getCreateNameScreen());
                      } else {
                        Get.find<SignUpController>().setClasses(classes);
                      }
                    }else if(typeFrom == 1){
                      Get.find<AddChildController>().setClassStud(classes);
                      Get.back();
                    }else{
                      Get.find<EditProfileController>().setClassStud(classes);
                      Get.back();
                    }
                  },
                );
              },
            );
          },
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

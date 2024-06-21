import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/presentation/screens/auth/sign%20in/controller/sign_in_controller.dart';
import 'package:shater/presentation/screens/auth/sign%20in/widgets/item_childern.dart';
import 'package:shater/presentation/screens/base/button_bottom.dart';

class ChildrenWidget extends StatelessWidget {
  const ChildrenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      builder: (controller) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GridView.builder(
            shrinkWrap: true,
            itemCount: controller.parentUser?.children?.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16),
            itemBuilder: (context, index) => ItemChildern(
              image: controller.parentUser?.children?[index].image,
              title: controller.parentUser?.children?[index].name,
              isSelected: controller.isSelectedChild(controller.parentUser?.children![index].id ?? -1),
              onTap: (){
                controller.changeSelectedChild(controller.parentUser?.children![index].id ?? -1);
              },
            ),
          ),
          ButtonBottom(
            onTap: () {
              //handle to select child go to home the child select
              controller.childSignIn(controller.selectedId);
            },
          )
        ],
      ),
    );
  }
}

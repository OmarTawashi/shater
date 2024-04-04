import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            itemCount: controller.user?.children?.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16),
            itemBuilder: (context, index) => ItemChildern(),
          ),
          ButtonBottom(
            onTap: () {
              //handle to select child go to home the child select
            },
          )
        ],
      ),
    );
  }
}

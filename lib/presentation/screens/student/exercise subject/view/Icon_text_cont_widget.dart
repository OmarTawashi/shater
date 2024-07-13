import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/custom_intike_container.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/dimensions.dart';

class IconTextCont extends StatelessWidget {
  final String text;
  const IconTextCont({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 62),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.getTeacherDashBoardScreen());
        },
        child: CustomIntikeContainer(
          paddingHorizontal: Dimensions.paddingSize12,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.arrow_back_ios_new_sharp,
                  color: Colors.white, size: 18),
              const SizedBox(
                width: Dimensions.paddingSize10,
              ),
              CustomText(
                text: text,
                color: Colors.white,
                fontSize: Dimensions.fontSize14,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
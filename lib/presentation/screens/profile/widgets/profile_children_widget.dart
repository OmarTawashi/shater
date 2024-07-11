import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/presentation/screens/profile/controller/profile_controller.dart';

import 'add_child_button.dart';
import 'intike_profile_imoji.dart';

class ProfileChildrenWidget extends StatelessWidget {
  const ProfileChildrenWidget({
    super.key,
    required this.parentUser,
    required this.controller,
  });

  final User? parentUser;
  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    int childCount = (parentUser?.children ?? []).length;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 00.w),
      child: ListView.separated(
        itemCount: childCount < 3 ? childCount + 1 : childCount,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemBuilder: (context, i) {
          if (childCount < 3) {
            return Padding(
              padding: i == 0
                  ? EdgeInsetsDirectional.only(start: 20)
                  : i == ((parentUser?.children ?? []).length - 1)
                      ? EdgeInsetsDirectional.only(end: 20)
                      : EdgeInsetsDirectional.zero,
              child: i == childCount
                  ? AddChildButton()
                  : IntikeProfileImoji(
                      imageUrl: parentUser?.children![i].image,
                      text: parentUser?.children![i].name,
                      isEnable: controller
                          .isSelectedChild(parentUser?.children![i].id ?? 0),
                      onTap: () {
                        log("apiToken $i : ${parentUser?.children![i].apiToken}");
                        if (parentUser != null) {
                          controller
                              .changeSelectedChild(parentUser!.children![i]);
                        }
                      },
                    ),
            );
          }else{
            return Padding(
              padding: i == 0
                  ? EdgeInsetsDirectional.only(start: 20)
                  : i == (childCount - 1)
                  ? EdgeInsetsDirectional.only(end: 20)
                  : EdgeInsetsDirectional.zero,
              child: IntikeProfileImoji(
                imageUrl: parentUser?.children![i].image,
                text: parentUser?.children![i].name,
                isEnable: controller
                    .isSelectedChild(parentUser?.children![i].id ?? 0),
                onTap: () {
                  log("apiToken $i : ${parentUser?.children![i].apiToken}");
                  if (parentUser != null) {
                    controller
                        .changeSelectedChild(parentUser!.children![i]);
                  }
                },
              ),
            );
          }
        },
        separatorBuilder: (context, i) {
          return SizedBox(
            width: 95.w,
          );
        },
      ),
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //   children: [
    //
    //     // first child
    //     (signInController.parentUser?.children ?? []).isNotEmpty
    //         ? IntikeProfileImoji(
    //       imageUrl: signInController
    //           .parentUser?.children![0].image,
    //       text: signInController
    //           .parentUser?.children![0].name,
    //       onTap: (){
    //         log("isSelectedChild 0 : ${signInController.isSelectedChild(
    //             signInController
    //                 .parentUser?.children![0].id ??
    //                 0)}");
    //       },
    //       isEnable: signInController.isSelectedChild(
    //           signInController
    //               .parentUser?.children![0].id ??
    //               0),
    //     )
    //         : SizedBox.shrink(),
    //
    //
    //     // second child
    //     (signInController.parentUser?.children ?? []).length > 1
    //         ? IntikeProfileImoji(
    //       imageUrl: signInController
    //           .parentUser?.children![1].image,
    //       text: signInController
    //           .parentUser?.children![1].name,
    //       onTap: (){
    //         log("isSelectedChild 1 : ${signInController.isSelectedChild(
    //             signInController
    //                 .parentUser?.children![1].id ??
    //                 0)}");
    //       },
    //       isEnable: signInController.isSelectedChild(
    //           signInController
    //               .parentUser?.children![1].id ??
    //               0),
    //     )
    //         : SizedBox.shrink(),
    //
    //     // last child
    //     (signInController.parentUser?.children ?? []).length > 2
    //         ? IntikeProfileImoji(
    //       imageUrl: signInController
    //           .parentUser?.children![2].image,
    //       text: signInController
    //           .parentUser?.children![2].name,
    //       onTap: (){
    //         log("isSelectedChild 2 : ${signInController.isSelectedChild(
    //             signInController
    //                 .parentUser?.children![2].id ??
    //                 0)}");
    //       },
    //       isEnable: signInController.isSelectedChild(
    //           signInController
    //               .parentUser?.children![2].id ??
    //               0),
    //     )
    //         : AddChildButton(),
    //   ],
    // );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/custom_empty_view.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/notification%20&%20contact/contact_me/view/contact_me_screen.dart';
import 'package:shater/presentation/screens/student/questions/lesson/controller/lesson_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class CommentWidget extends StatelessWidget {
  final LessonController? controller;
  const CommentWidget({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LessonController>(
      builder: (controller) => Container(
        height: 700.h,
        padding: EdgeInsets.only(top: Dimensions.paddingSize10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.close,
                            size: 23,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: CustomText(
                            text: '${controller?.comments.length}' +
                                '\t' +
                                'commentting'.tr,
                            textAlign: TextAlign.center,
                            fontSize: Dimensions.fontSize16,
                            color: Color.fromRGBO(128, 127, 127, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSize20,
                  ),
                  CommentList(controller!),
                  // AnimatorContainer(
                  //   viewType: controller.viewType,
                  //   isSliver: false,
                  //   errorWidget: CustomEmptyView(
                  //     assetName: ICONS.decriptionTop,
                  //     primaryText: 'subjects',
                  //     secanderyText: 'error_for_get_subject',
                  //   ),
                  //   emptyParams: EmptyParams(
                  //       text: 'subjects'.tr,
                  //       caption: 'empty_subject'.tr,
                  //       image: ICONS.decriptionTop),
                  //   successWidget: CommentList(controller),
                  //   retry: () {
                  //     controller.fetchComments();
                  //   },
                  // ),
                  SizedBox(
                    height: 100.h,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                  duration: Duration(microseconds: 0),
                  color: Colors.white,
                  child: FormWriteMessage(
                    hintText: 'write_comment',
                    fontColor: COLORS.primaryColor,
                    isLoading: controller?.isLoadingMessage,
                    controller: controller?.messageController,
                    onTap: () {
                      controller?.sendMessage();
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget CommentList(LessonController controller) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => ListTile(
              horizontalTitleGap: Dimensions.paddingSize10,
              minLeadingWidth: 0,
              leading: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.amber,
                  child: CachedNetworkImageWidget(
                      imageUrl: controller.comments[index].user?.image ?? ''),
                ),
              ),
              title: CustomText(
                text: controller.comments[index].user?.name ?? '',
                fontSize: Dimensions.fontSize16,
                color: Color.fromRGBO(128, 127, 127, 1),
              ),
              subtitle: CustomText(
                text: controller.comments[index].comment ?? '',
                fontSize: Dimensions.fontSize14,
                color: Color.fromRGBO(51, 51, 52, 1),
              ),
            ),
        separatorBuilder: (context, index) => SizedBox(),
        itemCount: controller.comments.length);
  }
}

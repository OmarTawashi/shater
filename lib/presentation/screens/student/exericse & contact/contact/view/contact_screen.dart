import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/contact/controller/contact_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

import '../../../../../../util/images.dart';
import '../../../../base/custom_empty_view.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactController>(
      // init: Get.put(ContactController()),
      builder: (controller) => AnimatorContainer(
        viewType: controller.viewType,
        isSliver: true,
        errorWidget: const CustomEmptyView(
          assetName: ICONS.contactWhite,
          primaryText: 'not_find_message',
          secanderyText: 'find_message_teacher',
        ),
        emptyParams: EmptyParams(
            text: 'empty Level', caption: '', image: ICONS.internalServerError),
        successWidget: SliverList(
          delegate: SliverChildBuilderDelegate(
              childCount: 5, (context, index) => ItemContact()),
        ),
        retry: () {},
      ),
    );
  }
}

class ItemContact extends StatelessWidget {
  const ItemContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(Dimensions.paddingSize16,
          Dimensions.paddingSize10, Dimensions.paddingSize16, 0),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: COLORS.primaryColor),
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImageWidget(
              imageUrl: 'imageUrl ?? ' '',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: Dimensions.paddingSize12,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 10,
                    ),
                    SizedBox(
                      width: Dimensions.paddingSize5,
                    ),
                    CustomText(
                      text: 'محمد جمعه الطواشي',
                      color: COLORS.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      maxLine: 1,
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.paddingSize8,
                ),
                CustomText(
                  text:
                      'محمد جمعه الطواش محمد جمعه الطواشالطواشالطواش محمد جمعه الطواشي',
                  color: Color.fromRGBO(149, 152, 154, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                  textHeight: 1.3,
                  overFlow: TextOverflow.ellipsis,
                  maxLine: 2,
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: 'm'.tr + '6',
                color: Colors.grey,
                fontSize: Dimensions.fontSize12,
                fontWeight: FontWeight.w400,
                maxLine: 1,
              ),
              SizedBox(
                height: Dimensions.paddingSize10,
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: COLORS.secanderyColor, shape: BoxShape.circle),
                child: CustomText(
                  text: '2',
                  color: Colors.white,
                  fontSize: Dimensions.fontSize13,
                  fontWeight: FontWeight.w100,
                  maxLine: 1,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

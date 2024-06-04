import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/date_converter.dart';
import 'package:shater/data/model/contact_model.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/tap_section.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/contact_me/controller/contact_me_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/constant.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';
import 'package:shater/util/images.dart';

import '../../../../base/intike_tab_bar.dart';

class ContactMeScreen extends StatelessWidget {
  const ContactMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
        leading: ButtonBack(),
      ),
      bottomNavigationBar: GetBuilder<ContactMeController>(
        builder: (controller) => AnimatedContainer(
            duration: Duration(microseconds: 0),
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: FormWriteMessage(
              hintText: 'write_me',
              controller: controller.messageController,
              onTap: () {
                controller.addMessage();
              },
            )),
      ),
      body: GetBuilder<ContactMeController>(
        builder: (controller) => RefreshIndicator(
          onRefresh: () async {
            controller.fetchContactList();
          },
          child: CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              IntikeTapBar(
                assetName: ICONS.contactTop,
                child: Row(
                  children: [
                    TapSection(
                      isSelected: true,
                      text: 'app_shater'.tr,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: Dimensions.paddingSize16,
                ),
              ),
              AnimatorContainer(
                  viewType: controller.viewType,
                  isSliver: true,
                  errorWidget: SizedBox(),
                  retry: () {
                    controller.fetchContactList();
                  },
                  successWidget: SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: controller.messgaesResponse?.replies
                              ?.length, (context, index) {
                    final isAdmin = controller
                        .messgaesResponse?.replies?[index].userType
                        ?.contains('Admin');
                    return ItemMessage(
                      isAdmin: isAdmin,
                      replayMess: controller.messgaesResponse?.replies?[index],
                    );
                  }))),
            ],
          ),
        ),
      ),
    );
  }
}

class FormWriteMessage extends StatelessWidget {
  final Function()? onTap;
  final String? hintText;
  final Color fontColor;
  final bool? isLoading;
  final TextEditingController? controller;
  const FormWriteMessage(
      {super.key,
      this.onTap,
      this.isLoading = false,
      this.fontColor = Colors.white,
      this.hintText,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(72, 131, 196, 1),
                      borderRadius: BorderRadius.circular(13)),
                  child: isLoading!
                      ? CupertinoActivityIndicator(
                          color: Colors.white70,
                        )
                      : Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.white,
                          size: 20,
                          weight: 5,
                        ),
                ),
              ),
              SizedBox(
                width: Dimensions.paddingSize5,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  cursorColor: COLORS.primaryColor,
                  style: FontStyleConstant.hNLTRegular.copyWith(
                      color: fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSize15,
                      locale: Locale(
                          APPCONSTANT.languages[1].languageCode ?? '',
                          APPCONSTANT.languages[0].languageCode)),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return;
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(72, 131, 196, 1), width: 2)),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: '${hintText}'.tr,
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(72, 131, 196, 1), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(72, 131, 196, 1), width: 2)),
                    hintStyle: FontStyleConstant.hNLTRegular.copyWith(
                      color: Color.fromRGBO(72, 131, 196, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSize15,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(72, 131, 196, 1), width: 2)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ItemMessage extends StatelessWidget {
  final ReplayMessage? replayMess;
  const ItemMessage({
    super.key,
    required this.isAdmin,
    this.replayMess,
  });

  final bool? isAdmin;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: isAdmin == false
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: isAdmin == false
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSize8,
                      vertical: Dimensions.paddingSize8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: isAdmin == true
                          ? BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                              topRight: Radius.circular(8),
                            )
                          : BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              topLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            )),
                  child: CustomText(
                    text: replayMess?.text ?? '',
                    color: Colors.black,
                    fontSize: Dimensions.fontSize12,
                  ),
                ),
                SizedBox(
                  height: Dimensions.paddingSize5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CustomText(
                    text: DateConverter.formatTimestamp(
                        replayMess?.createdAt ?? ''),
                    fontSize: Dimensions.fontSize10 - 1,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}

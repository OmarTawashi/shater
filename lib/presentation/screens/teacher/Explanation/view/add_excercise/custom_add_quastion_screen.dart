import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/flavors/environment.dart';
import 'package:shater/presentation/screens/teacher/Explanation/record_title_audio/record_title_audio_controller_.dart';
import 'package:shater/presentation/screens/teacher/Explanation/view/add_excercise/add_quastion_controller.dart';
import 'package:shater/presentation/screens/teacher/My%20Explanation/custom_button.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/custom_textfield.dart';
import 'package:shater/presentation/screens/teacher/Explanation/view/add_excercise/slider_builder.dart';

class CustomAddQuastionScreen extends StatelessWidget {
  const CustomAddQuastionScreen({
    super.key,
    required this.appBarTitle,
    required this.exerciseType,
    required this.selectedQuastionWidget,
    required this.page_id,
    required this.idQuastion
  });
  final String appBarTitle;
  final int page_id;
final idQuastion;
  final ExerciseType exerciseType;
  final Widget selectedQuastionWidget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          appBarTitle,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: COLORS.primaryColor),
        ),
        backgroundColor: COLORS.secanderyColor,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: CustomeButton(
              backgroundColor: Colors.transparent,
              borderRadius: 20.r,
              borderwidth: 2,
              width: 86.w,
              height: 40.h,
              title: 'انشاء',
              onClick: () {
                Get.find<AddQuastionController>()
                    .createNewquastion(page_id: page_id,idQuastion :idQuastion);
              },
            ),
          ),
        ],
      ),
      body: GetBuilder<AddQuastionController>(
        builder: (controller) {
          return ListView(
            padding: EdgeInsets.all(10),
            children: [
              MainRow(
                title: "العنوان",
                titleTwo: "اكتب عنوان السؤال الرئيسي",
                withVoiceButton: true,
                textController: controller.titletextController,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: MainRow(
                  title: " العنوان 2 ",
                  titleTwo: "اكتب عنوان السؤال الفرعي (اختياري )",
                  isRequardField: true,
                  textController: controller.extraTitletextController,
                ),
              ),
              MainRow(
                title: "لمحة",
                titleTwo: "تظهر كتنبيه من أعلى الشاشة (اختياري)",
                textController: controller.hinttextController,
              ),
              SizedBox(
                height: 10.h,
              ),
              SliderBiulder(),
              SizedBox(
                height: 20.h,
              ),
              selectedQuastionWidget
            ],
          );
        },
      ),
    );
  }
}

class MainRow extends StatelessWidget {
  MainRow({
    super.key,
    required this.title,
    required this.titleTwo,
    required this.textController,
    this.isRequardField = false,
    this.withVoiceButton = false,
  });
  final String title;
  final String titleTwo;
  final bool isRequardField;
  final bool withVoiceButton;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          alignment: Alignment.center,
          height: 35.h,
          width: 77.w,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: COLORS.strokeColor),
          ),
          child: Text(
            title,
            style: TextStyle(color: COLORS.primaryColor),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 50.h,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: COLORS.strokeColor),
            ),
            child: Row(
              children: [
                Visibility(
                  visible: withVoiceButton,
                  child: GetBuilder<RecordController>(
                    builder: (controller) => SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: GestureDetector(
                        onTap: () => controller.showAudioPicker(
                            context: context, istitle: true),
                        child: Icon(
                          Icons.mic,
                          color: controller.titleAudiofilePath != null
                              ? COLORS.secanderyColor
                              : COLORS.midNightBlueColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    // width: 100,
                    // height: 100,
                    child: CustomeTextField(
                      textController: textController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: titleTwo,
                      maxLines: 3,
                      minLines: 2,
                      validate: isRequardField
                          ? (text) {
                              if (text!.isEmpty) {
                                return "الحقل مطلوب";
                              } else {
                                return null;
                              }
                            }
                          : (text) {
                              return null;
                            },
                    ),
                  ),
                ),
                GetBuilder<RecordController>(builder: (controller) {
                  return Visibility(
                    visible: withVoiceButton &&
                        controller.titleAudiofilePath != null,
                    child: SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: GestureDetector(
                        onTap: () => controller.deleteFile(isTitle: true),
                        child: Icon(Icons.delete_forever_outlined),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ],
    );
  }
}

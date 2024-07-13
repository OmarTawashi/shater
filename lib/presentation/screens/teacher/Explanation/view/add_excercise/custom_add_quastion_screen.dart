import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/flavors/environment.dart';
import 'package:shater/presentation/screens/teacher/My%20Explanation/custom_button.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/custom_textfield.dart';
import 'package:shater/presentation/screens/teacher/Explanation/view/add_excercise/slider_builder.dart';

class CustomAddQuastionScreen extends StatelessWidget {
  const CustomAddQuastionScreen({
    super.key,
    required this.appBarTitle,
    required this.exerciseType,
  });
  final String appBarTitle;
  final ExerciseType exerciseType;
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
              onClick: () {},
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          MainRow(
            title: "العنوان",
            titleTwo: "اكتب عنوان السؤال الرئيسي",
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: MainRow(
              title: " العنوان 2 ",
              titleTwo: "اكتب عنوان السؤال الفرعي (اختياري )",
              isRequardField: true,
            ),
          ),
          MainRow(
            title: "لمحة",
            titleTwo: "تظهر كتنبيه من أعلى الشاشة (اختياري)",
          ),
          SizedBox(
            height: 10.h,
          ),
          SliderBiulder(),
        ],
      ),
    );
  }
}

class MainRow extends StatelessWidget {
  MainRow(
      {super.key,
      required this.title,
      required this.titleTwo,
      this.isRequardField = false});
  final String title;
  final String titleTwo;
  final bool isRequardField;

  final TextEditingController textEditingController = TextEditingController();
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
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: COLORS.strokeColor),
            ),
            child: CustomeTextField(
              textController: textEditingController,
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
      ],
    );
  }
}

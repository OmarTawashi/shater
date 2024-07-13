import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/edit%20profile/widgets/custom_border_text.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/constant.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';

class CustomEditForm extends StatelessWidget {
  final String? textLeading;
  final TextEditingController? textEditingController;
  final Function()? tapTrailing;
  const CustomEditForm(
      {super.key,
      this.textLeading,
      this.textEditingController,
      this.tapTrailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: CustomBorderText(
            horizontalMargin: 0,
            horizontalPadding: 0,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CustomText(
                text: textLeading ?? '',
                textAlign: TextAlign.center,
                fontSize: Dimensions.fontSize13,
                color: COLORS.backGroundColor,
                maxLine: 1,
              ),
            ),
          ),
        ),
        SizedBox(
          width: Dimensions.paddingSize5,
        ),
        Expanded(
            flex: 5,
            child: TextFormField(
              textAlign: TextAlign.center,
              controller: textEditingController,
              style: FontStyleConstant.hNLTRegular.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSize14,
                  locale: Locale(APPCONSTANT.languages[1].languageCode ?? '',
                      APPCONSTANT.languages[0].languageCode)),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                enabled: true,
                alignLabelWithHint: true,
                suffixIconColor: COLORS.secanderyColor,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.all(12),
                filled: true,
                fillColor: COLORS.backGroundColor,
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                hintStyle: FontStyleConstant.hNLTRegular.copyWith(
                  color: Color.fromRGBO(159, 191, 216, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSize15,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
              ),
            )),
        SizedBox(
          width: Dimensions.paddingSize5,
        ),
        // Expanded(
        //   child: CustomBorderText(
        //     horizontalMargin: 0,
        //     child: Padding(
        //       padding: const EdgeInsets.all(2.0),
        //       child: GestureDetector(
        //         onTap: tapTrailing,
        //         child: Container(
        //           decoration: BoxDecoration(
        //             border: Border.all(color: Colors.white54)
        //           ),
        //           child: Icon(
        //             Icons.arrow_forward_ios_sharp,
        //             color: Colors.white54,
        //             size: 18,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        Expanded(
          child: Container(
            height: 52.h,
            width: 52.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: COLORS.strokeColor,
                width: 1.8,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:shater/presentation/screens/base/text_custom.dart';
// import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
// import 'package:shater/util/color.dart';
// import 'package:shater/util/dimensions.dart';
// import 'package:shater/util/font_style.dart';

// class ComprehensiveImage extends StatelessWidget {
//   final QuestionController? controller;
//   const ComprehensiveImage({super.key, this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ItemNumber(
//               itemNum: '6',
//             ),
//             TypeOperator(
//               icon: Icons.add,
//             ),
//             ItemNumber(
//               itemNum: '8',
//             ),
//             TypeOperator(
//               icon: Icons.add,
//             ),

//             SizedBox(
//               width: Dimensions.paddingSize10,
//             ),
//             ItemUnit(
//               itemUnit: 'لترا',
//             )
//           ],
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/api_constant.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';

class InputAnswerOperater extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController? textEditingController;
  const InputAnswerOperater(
      {super.key,this.textEditingController, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      style: FontStyleConstant.hNLTBMedium.copyWith(
        fontSize: Dimensions.fontSize16,
        color: COLORS.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        constraints: BoxConstraints(maxHeight: 49, maxWidth: 56),
        contentPadding: EdgeInsets.all(5),
        fillColor: Color.fromRGBO(190, 190, 190, 1),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none),
        labelText: '',
      ),
    );
  }
}

class TypeOperator extends StatelessWidget {
  final IconData? icon;
  const TypeOperator({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      weight: 50,
      color: COLORS.secanderyColor,
      size: 25,
    );
  }
}

class ItemStable extends StatelessWidget {
  final String? text;
  final double? row;
  const ItemStable({super.key, this.row, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 49, maxWidth: 56 * (row ?? 1.0)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: text!.contains('uploads')
            ? Colors.transparent
            : COLORS.secanderyColor,
        border: Border.all(
            width: 2,
            color: text!.contains('uploads')
                ? Color.fromRGBO(190, 190, 190, 1)
                : Colors.transparent),
        borderRadius: BorderRadius.circular(5),
      ),
      child: text!.contains('uploads')
          ? CachedNetworkImageWidget(imageUrl: ApiConstant.baseUrl + '/$text')
          : CustomText(
              text: text ?? '',
              fontSize: Dimensions.fontSize18,
              textAlign: TextAlign.center,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
    );
  }
}

class ItemUnit extends StatelessWidget {
  final String? itemUnit;
  const ItemUnit({super.key, this.itemUnit});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 49, maxWidth: 56),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: COLORS.secanderyColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: CustomText(
        text: itemUnit ?? '',
        fontSize: Dimensions.fontSize18,
        textAlign: TextAlign.center,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class ArithmeticText extends StatelessWidget {
  final QuestionController? controller;
  const ArithmeticText({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
      child: Column(
        children: [
          Wrap(
            runSpacing: Dimensions.paddingSize12,
            alignment: WrapAlignment.center,
            spacing: Dimensions.paddingSize10,
            children: List.generate(3, (index) {
              return Row(
                children: [
                  Column(
                    children: [
                      ItemStableText(
                        row: 1,
                        text: '1',
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      ItemStableText(
                        row: 1,
                        text: '1',
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  ItemStableText(
                    row: 2,
                    text: '1',
                  ),
                  TypeOperatorText(
                    icon: Icons.add,
                  )
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}

class TypeOperatorText extends StatelessWidget {
  final IconData? icon;
  const TypeOperatorText({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      weight: 500,
      color: COLORS.primaryColor,
      size: 25,
    );
  }
}

class ItemStableText extends StatelessWidget {
  final String? text;
  final double? row;
  const ItemStableText({super.key, this.row, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 35 * (row ?? 1.0), maxWidth: 37),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: COLORS.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: CustomText(
        text: text ?? '',
        fontSize: Dimensions.fontSize16,
        textAlign: TextAlign.center,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

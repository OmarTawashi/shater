import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/dimensions.dart';

class HeaderQuestionSection extends StatelessWidget {
  final String? titleQuestion;
  final String? subTitleQuestion;
  const HeaderQuestionSection(
      {super.key, this.titleQuestion, this.subTitleQuestion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Dimensions.paddingSize10 + 2,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: CustomText(
                  text: titleQuestion ?? '',
                  fontSize: Dimensions.fontSize16 + 1,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(96, 96, 96, 1),
                ),
              ),
              Icon(
                Icons.alternate_email,
              )
            ],
          ),
          SizedBox(
            height: Dimensions.paddingSize10,
          ),
          CustomText(
            text: subTitleQuestion ?? '',
            fontSize: Dimensions.fontSize16,
             textAlign: TextAlign.start,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(123, 123, 123, 1),
          ),
        ],
      ),
    );
  }
}

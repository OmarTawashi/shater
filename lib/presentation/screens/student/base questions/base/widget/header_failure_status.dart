import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/dimensions.dart';

class HeaderFailureStatus extends StatelessWidget {
  const HeaderFailureStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(Dimensions.paddingSize16,
          Dimensions.paddingSize16, Dimensions.paddingSize16, 0),
      child: Row(
        children: [
          SelectTapFailure(
            text: 'show_explain',
            isSelect: false,
            onTap: () {},
          ),
          SizedBox(
            width: Dimensions.paddingSize16,
          ),
          SelectTapFailure(
            text: 'true',
            isSelect: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class SelectTapFailure extends StatelessWidget {
  final bool isSelect;
  final String? text;
  final Function()? onTap;
  const SelectTapFailure(
      {super.key, this.isSelect = false, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: isSelect
                  ? text == 'true'
                      ? Color.fromRGBO(106, 209, 0, 1)
                      : Color.fromRGBO(8, 202, 254, 1)
                  : Colors.transparent,
              border: Border.all(
                  color: text == 'true'
                      ? Color.fromRGBO(106, 209, 0, 1)
                      : Color.fromRGBO(8, 202, 254, 1),
                  width: 2.5),
              borderRadius: BorderRadius.circular(8)),
          child: CustomText(
            text: text ?? '',
            textAlign: TextAlign.center,
            fontSize: Dimensions.fontSize18,
            color: !isSelect
                ? text == 'true'
                    ? Color.fromRGBO(106, 209, 0, 1)
                    : Color.fromRGBO(8, 202, 254, 1)
                : Colors.white,
            fontWeight: FontWeight.bold,
            maxLine: 1,
          ),
        ),
      ),
    );
  }
}

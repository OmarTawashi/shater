// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class OrderText extends StatefulWidget {
  final QuestionController controller;

  OrderText({
    super.key,
    required this.controller,
  });

  @override
  State<OrderText> createState() => _OrderTextState();
}

class _OrderTextState extends State<OrderText> {
  @override
  void initState() {
    super.initState();
    widget.controller.getOldListOrderText();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingSize16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: COLORS.primaryColor,
                borderRadius: BorderRadius.circular(Dimensions.radius10 + 2),
              ),
              child: Wrap(
                runSpacing: 16,
                spacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: List.generate(
                    widget.controller.newListOrderText.length, (index) {
                  return DragTarget<int>(
                    onAcceptWithDetails: (details) {
                      widget.controller.setOrderText(
                        details.data,
                        index,
                        widget.controller.orderTextIndex[details.data],
                      );
                    },
                    builder: (context, candidateData, rejectedData) =>
                        ItemOrderText(
                      text: widget.controller.newListOrderText[index],
                      isEmpty:
                          widget.controller.newListOrderText[index] == "null",
                    ),
                  );
                }),
              )),
          SizedBox(
            height: 40.h,
          ),
          Wrap(
            runSpacing: 16,
            spacing: 16,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: List.generate(widget.controller.oldListOrderText.length,
                (index) {
              return IgnorePointer(
                ignoring: widget.controller.oldListOrderText[index] == "null",
                child: Draggable<int>(
                  data: index,
                  childWhenDragging: ItemOrderText(
                      text: widget.controller.oldListOrderText[index],
                      isEmpty:
                          widget.controller.oldListOrderText[index] == "null"),
                  feedback: Material(
                    color: Colors.transparent,
                    child: ItemOrderText(
                        text: widget.controller.oldListOrderText[index],
                        isEmpty: widget.controller.oldListOrderText[index] ==
                            "null"),
                  ),
                  child: ItemOrderText(
                      text: widget.controller.oldListOrderText[index],
                      isEmpty:
                          widget.controller.oldListOrderText[index] == "null"),
                ),
              );
            }),
          ),
          SizedBox(
            height: 120.h,
          )
        ],
      ),
    );
  }
}

class ItemOrderText extends StatelessWidget {
  final String text;
  final bool? isEmpty;
  const ItemOrderText({super.key, this.isEmpty, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.w,
      height: 75.h,
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: COLORS.whiteColor,
        border: Border.all(
            color: Color.fromRGBO(228, 228, 228, 1),
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside),
        borderRadius: BorderRadius.circular(13),
      ),
      child: isEmpty == true
          ? null
          : CustomText(
              text: text,
              fontSize: Dimensions.fontSize16,
              color: COLORS.primaryColor,
              textAlign: TextAlign.center,
            ),
    );
  }
}

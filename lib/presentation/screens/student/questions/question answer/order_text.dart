import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class OrderText extends StatelessWidget {
  final QuestionController controller;

  const OrderText({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingSize16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 107,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: COLORS.primaryColor,
              borderRadius: BorderRadius.circular(Dimensions.radius10 + 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.newList.length,
                (index) {
                  return DragTarget<int>(
                    builder: (BuildContext context, List<dynamic> accepted,
                        List<dynamic> rejected) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 70,
                            height: 50,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSize5,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: COLORS.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: CustomText(
                              text: controller.newList[index],
                              fontSize: Dimensions.fontSize15,
                              color: COLORS.primaryColor,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.paddingSize16,
                          )
                        ],
                      );
                    },
                    onAcceptWithDetails: (DragTargetDetails<int> data) {
                      controller.dragItem(data.data, index);
                    },
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.oldList.length + controller.newList.length,
              (index) {
                return LongPressDraggable<int>(
                  data: controller.newList.indexOf(controller.oldList[index]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      controller.oldList.isEmpty ||
                              index >= controller.oldList.length
                          ? Container(
                              width: 70,
                              height: 50,
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.paddingSize10,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(228, 228, 228, 1),
                                borderRadius: BorderRadius.circular(13),
                              ),
                            )
                          : Container(
                              width: 70,
                              height: 50,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.paddingSize5,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                                border: Border.all(
                                  color: COLORS.primaryColor,
                                  width: 2,
                                ),
                              ),
                              child: CustomText(
                                text: controller.oldList[index],
                                fontSize: Dimensions.fontSize15,
                                color: COLORS.primaryColor,
                                textAlign: TextAlign.center,
                              ),
                            ),
                      SizedBox(
                        width: Dimensions.paddingSize16,
                      )
                    ],
                  ),
                  feedback: Material(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                    child: Container(
                      width: 70,
                      height: 50,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSize5,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(
                          color: COLORS.primaryColor,
                          width: 2,
                        ),
                      ),
                      child: CustomText(
                        text: controller.oldList[index],
                        fontSize: Dimensions.fontSize15,
                        color: COLORS.primaryColor,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  childWhenDragging: Container(
                    width: 70,
                    height: 50,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSize5,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

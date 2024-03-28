import 'package:flutter/material.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
import 'package:shater/util/api_constant.dart';
import 'package:shater/util/dimensions.dart';

class MultiChoiceImage extends StatelessWidget {
  final QuestionController? controller;
  MultiChoiceImage({super.key, this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          itemCount: controller?.questionModel?.answer?.length,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final isSelect = controller?.selectIndex == index;
            return GestureDetector(
              onTap: () {
                controller
                    ?.setAnswer(controller?.questionModel?.answer?[index]);
                controller?.setSelectIndex(index);
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: isSelect == true
                          ? controller?.questionStatus.getGridItemColor()
                          : Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 0,
                            offset: Offset(0, 0))
                      ]),
                  child: CachedNetworkImageWidget(
                      imageUrl: ApiConstant.baseUrl +
                          "/${controller?.questionModel?.urls?[index]}")),
            );
          },
        )
      ],
    );
  }
}

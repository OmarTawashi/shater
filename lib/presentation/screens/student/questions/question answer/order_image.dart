// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:shater/util/api_constant.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class OrderImage extends StatefulWidget {
  final QuestionController controller;

  OrderImage({
    super.key,
    required this.controller,
  });

  @override
  State<OrderImage> createState() => _OrderImageState();
}

class _OrderImageState extends State<OrderImage> {
  @override
  void initState() {
    super.initState();
    widget.controller.getOldListOrderImage();
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
                    widget.controller.newListOrderImage.length, (index) {
                  return DragTarget<int>(
                    onAcceptWithDetails: (details) {
                      widget.controller.setOrderImage(
                        details.data,
                        index,
                        widget.controller.orderImageIndex[details.data],
                      );
                    },
                    builder: (context, candidateData, rejectedData) =>
                        ItemOrderImage2(
                      imageUrl: widget.controller.newListOrderImage[index],
                      isEmpty:
                          widget.controller.newListOrderImage[index] == "null",
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
            children: List.generate(widget.controller.oldListOrderImage.length,
                (index) {
              return IgnorePointer(
                ignoring: widget.controller.oldListOrderImage[index] == "null",
                child: Draggable<int>(
                  data: index,
                  childWhenDragging: ItemOrderImage2(
                      imageUrl: widget.controller.oldListOrderImage[index],
                      isEmpty:
                          widget.controller.oldListOrderImage[index] == "null"),
                  feedback: Material(
                    color: Colors.transparent,
                    child: ItemOrderImage2(
                        imageUrl: widget.controller.oldListOrderImage[index],
                        isEmpty: widget.controller.oldListOrderImage[index] ==
                            "null"),
                  ),
                  child: ItemOrderImage2(
                      imageUrl: widget.controller.oldListOrderImage[index],
                      isEmpty:
                          widget.controller.oldListOrderImage[index] == "null"),
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

class ItemOrderImage2 extends StatelessWidget {
  final String imageUrl;
  final bool? isEmpty;
  const ItemOrderImage2({super.key, this.isEmpty, required this.imageUrl});

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
          : CachedNetworkImageWidget(
              imageUrl: ApiConstant.baseUrl + '/' + imageUrl,
              fit: BoxFit.cover,
              width: 75.w,
              height: 75.h,
            ),
    );
  }
}

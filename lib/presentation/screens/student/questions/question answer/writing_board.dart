import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:signature/signature.dart';

class WritingBoard extends StatefulWidget {
  final QuestionController controller;
  const WritingBoard({super.key, required this.controller});

  @override
  State<WritingBoard> createState() => _WritingBoardState();
}

class _WritingBoardState extends State<WritingBoard> {
  @override
  void initState() {
    super.initState();
    widget.controller.signatureWriteController = SignatureController(
      penStrokeWidth: 5,
      penColor: COLORS.primaryColor,
      strokeCap: ui.StrokeCap.round,
      strokeJoin: ui.StrokeJoin.round,
      exportBackgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 300.h,
              width: Get.width,
              decoration:
                  BoxDecoration(color: Color.fromRGBO(172, 177, 173, 0.2)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ListView.separated(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 40,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Divider(
                            color: Colors.black,
                            height: 0,
                          ),
                          SizedBox(
                            height: Dimensions.fontSize10,
                          ),
                          DottedDivider(),
                          SizedBox(
                            height: Dimensions.fontSize10,
                          ),
                          Divider(
                            color: Colors.black,
                            height: 0,
                          ),
                          SizedBox(
                            height: Dimensions.fontSize10,
                          ),
                          DottedDivider(),
                        ],
                      );
                    },
                  ),
                  Positioned(
                    top: 110,
                    child: CustomText(
                      text:
                          widget.controller.questionModel?.answer?.first ?? '',
                      color: Colors.black26,
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
            ),
            Builder(builder: (context) {
              widget.controller.signatureWriteController?.addListener(() {
                widget.controller.setQuestionStatus(QuestionStatusEnum.select);
              });
              return Signature(
                controller: widget.controller.signatureWriteController!,
                height: 300.h,
                backgroundColor: Colors.transparent,
              );
            }),
          ],
        ),
        SizedBox(
          height: Dimensions.paddingSize10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                widget.controller.signatureWriteController?.clear();
              },
              child: CustomText(
                text: 'clear',
                color: COLORS.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DottedDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedPainter(),
      child: Container(
        height: 1.0,
      ),
    );
  }
}

class DottedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black // Change color as per your requirement
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;

    final double dashWidth = 1.0;
    final double dashSpace = 3.0;
    double currentX = 0.0;

    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, 0.0),
        Offset(currentX + dashWidth, 0.0),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

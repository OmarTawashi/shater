import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class MatchImage extends StatelessWidget {
  final QuestionController? controller;
  const MatchImage({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                      height: 80,
                      width: 141,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        border:
                            Border.all(width: 2.5, color: COLORS.primaryColor),
                      ),
                      child: CachedNetworkImageWidget(
                        imageUrl: '   ',
                        height: 78,
                        width: 141,
                      )),
                  separatorBuilder: (context, index) => SizedBox(
                    height: Dimensions.paddingSize12,
                  ),
                  itemCount: 4,
                ),
              ),
              SizedBox(
                width: 120.w,
              ),
              Expanded(
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                          height: 80,
                          width: 141,
                          padding: EdgeInsets.symmetric(
                              horizontal: 26, vertical: 27),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                                width: 2.5, color: COLORS.primaryColor),
                          ),
                          child: CustomText(
                            text: 'text',
                            fontSize: Dimensions.fontSize15,
                            color: Color.fromRGBO(96, 96, 96, 1),
                            maxLine: 1,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: Dimensions.paddingSize12,
                        ),
                    itemCount: 4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class MatchImagew extends StatelessWidget {
  final QuestionController? controller;
  const MatchImagew({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                        height: 80,
                        width: 141,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border:
                              Border.all(width: 2.5, color: COLORS.primaryColor),
                        ),
                        child: CachedNetworkImageWidget(
                          imageUrl: '   ',
                          height: 78,
                          width: 141,
                        )),
                    separatorBuilder: (context, index) => SizedBox(
                      height: Dimensions.paddingSize12,
                    ),
                    itemCount: 4,
                  ),
                ),
                SizedBox(
                  width: 120.w,
                ),
                Expanded(
                  child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                            height: 80,
                            width: 141,
                            padding: EdgeInsets.symmetric(
                                horizontal: 26, vertical: 27),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              border: Border.all(
                                  width: 2.5, color: COLORS.primaryColor),
                            ),
                            child: CustomText(
                              text: 'text',
                              fontSize: Dimensions.fontSize15,
                              color: Color.fromRGBO(96, 96, 96, 1),
                              maxLine: 1,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: Dimensions.paddingSize12,
                          ),
                      itemCount: 4),
                ),
              ],
            ),
          ),
          CustomPaint(
            size: Size.infinite,
            painter: LinePainter(),
          ),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = COLORS.primaryColor // Color of the line
      ..strokeWidth = 2.5; // Thickness of the line

    Offset start = Offset(0, size.height / 2);
    Offset end = Offset(size.width, size.height / 2);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return  true;
  }
}

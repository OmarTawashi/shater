import 'package:flutter/material.dart';
import 'package:shater/core/extenstion/question_status.dart';

import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:shater/util/color.dart';

class MatchText extends StatefulWidget {
  final QuestionController controller;
  const MatchText({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  _MatchTextState createState() => _MatchTextState();
}

class _MatchTextState extends State<MatchText> with TickerProviderStateMixin {
  List<Offset?> currentLine = [];
  List<List<Offset?>> lines = [];
  Offset? startPoint;
  Offset? endPoint;

  List<GlobalKey> leftItemKeys = List.generate(4, (_) => GlobalKey());
  List<GlobalKey> rightItemKeys = List.generate(4, (_) => GlobalKey());

  List<Map<String, GlobalKey>> matchedPairs = [];
  @override
  void initState() {
    super.initState();
    widget.controller.getListMatchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          Column(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.controller.leftItems.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        return GestureDetector(
                          key: leftItemKeys[index],
                          child: ItemMatchTextR(
                            item: item,
                            isImage: false,
                          ),
                        );
                      }).toList(),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.controller.rightItems.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        return GestureDetector(
                          key: rightItemKeys[index],
                          child: ItemMatchText(
                            item: item,
                            isImage: false,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onPanStart: (details) {
              RenderBox? renderBox = context.findRenderObject() as RenderBox?;
              if (renderBox != null) {
                setState(() {
                  startPoint = renderBox.globalToLocal(details.globalPosition);
                });
              }
            },
            onPanUpdate: (details) {
              RenderBox? renderBox = context.findRenderObject() as RenderBox?;
              if (renderBox != null && startPoint != null) {
                setState(() {
                  endPoint = renderBox.globalToLocal(details.globalPosition);
                });
              }
            },
            onPanEnd: (details) {
              if (startPoint != null && endPoint != null) {
                setState(() {
                  lines.add([startPoint, endPoint]);
                  startPoint = null;
                  endPoint = null;
                });
                widget.controller.setQuestionStatus(QuestionStatusEnum.select);
              }
            },
            child: CustomPaint(
              painter: LineDrawingPainter(lines, startPoint, endPoint),
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemMatchTextR extends StatelessWidget {
  final dynamic item;
  final bool isImage;
  const ItemMatchTextR({super.key, this.isImage = false, this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Stack(
        children: [
          Container(
              height: 60,
              width: 110,
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(width: 3.5, color: COLORS.primaryColor),
              ),
              child: !isImage
                  ? CustomText(
                      text: item,
                      fontSize: 18,
                      color: Color.fromRGBO(96, 96, 96, 1),
                      fontWeight: FontWeight.w500,
                    )
                  : CachedNetworkImageWidget(
                      imageUrl: item,
                      fit: BoxFit.cover,
                      height: 60,
                      width: 110,
                    )),
          Positioned(
            left: 2.5,
            top: 20,
            child: CircleAvatar(
              radius: 9,
              backgroundColor: COLORS.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class ItemMatchText extends StatelessWidget {
  final dynamic item;
  final bool isImage;

  const ItemMatchText({super.key, this.isImage = false, this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                height: 60,
                width: 110,
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(width: 3.5, color: COLORS.primaryColor),
                ),
                child: !isImage
                    ? CustomText(
                        text: item,
                        fontSize: 18,
                        color: Color.fromRGBO(96, 96, 96, 1),
                        fontWeight: FontWeight.w500,
                      )
                    : CachedNetworkImageWidget(
                        imageUrl: item,
                        fit: BoxFit.cover,
                        height: 60,
                        width: 110,
                      )),
          ),
          Positioned(
            right: 2.2,
            top: 20,
            child: CircleAvatar(
              radius: 9,
              backgroundColor: COLORS.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class LineDrawingPainter extends CustomPainter {
  final List<List<Offset?>> lines;
  final Offset? startPoint;
  final Offset? endPoint;

  LineDrawingPainter(this.lines, this.startPoint, this.endPoint);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = COLORS.primaryColor
      ..strokeWidth = 5.5
      ..strokeCap = StrokeCap.round;

    // Draw all saved lines
    for (var line in lines) {
      if (line.length == 2 && line[0] != null && line[1] != null) {
        canvas.drawLine(line[0]!, line[1]!, paint);
      }
    }

    // Draw the current line being panned
    if (startPoint != null && endPoint != null) {
      canvas.drawLine(startPoint!, endPoint!, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

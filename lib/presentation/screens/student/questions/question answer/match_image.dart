import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/images.dart';

class MatchingQuizScreen extends StatefulWidget {
  @override
  _MatchingQuizScreenState createState() => _MatchingQuizScreenState();
}

class _MatchingQuizScreenState extends State<MatchingQuizScreen> {
  final List<String> rightItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];
  final List<String> leftItems = [
    IMAGES.loadingGif,
    IMAGES.loadingGif,
    IMAGES.loadingGif,
    IMAGES.loadingGif
  ];

  List<Offset?> points = [];
  Offset? startPoint;
  Offset? endPoint;

  Map<String, String> matchedItems = {};

  List<GlobalKey> leftItemKeys = List.generate(4, (_) => GlobalKey());
  List<GlobalKey> rightItemKeys = List.generate(4, (_) => GlobalKey());

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
                      children: leftItems.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        return GestureDetector(
                          key: leftItemKeys[index],
                          child: ItemMatchImage(item: item),
                        );
                      }).toList(),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: rightItems.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        return GestureDetector(
                          key: rightItemKeys[index],
                          child: ItemMatchText(item: item),
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
                startPoint = renderBox.globalToLocal(details.globalPosition);
                setState(() {
                  points.add(startPoint!);
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
              if (endPoint != null) {
                int? leftIndex = getClosestItemIndex(leftItemKeys, startPoint!);
                int? rightIndex = getClosestItemIndex(rightItemKeys, endPoint!);
                if (leftIndex != null && rightIndex != null) {
                  addMatch(leftIndex, rightIndex);
                }
                setState(() {
                  points.add(endPoint!);
                  startPoint = null;
                  endPoint = null;
                });
              }
            },
            child: CustomPaint(
              painter: LineDrawingPainter(points, startPoint, endPoint),
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }

  void addMatch(int leftIndex, int rightIndex) {
    setState(() {
      matchedItems[leftItems[leftIndex]] = rightItems[rightIndex];
    });
  }

  int? getClosestItemIndex(List<GlobalKey> keys, Offset point) {
    print('Point: $point');
    for (int i = 0; i < keys.length; i++) {
      final keyContext = keys[i].currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          final size = box.size;
          final rect =
              Rect.fromLTWH(position.dx, position.dy, size.width, size.height);
          // Log the rectangle details
          print('Rect $i: $rect');

          if (rect.contains(point)) {
            print('Point is inside rect $i');
            return i;
          }
        }
      }
    }
    return null;
  }
}

class ItemMatchImage extends StatelessWidget {
  final dynamic item;
  const ItemMatchImage({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Stack(
        children: [
          Container(
            height: 70,
            width: 110,
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(width: 4, color: COLORS.primaryColor),
            ),
            child: Image.asset(item),
          ),
          Positioned(
            left: 2,
            top: 25,
            child: CircleAvatar(
              radius: 10,
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
  const ItemMatchText({super.key, this.item});

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
              height: 70,
              width: 110,
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(width: 4, color: COLORS.primaryColor),
              ),
              child: CustomText(
                text: item,
                fontSize: 20,
                color: Color.fromRGBO(96, 96, 96, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            right: 1.5,
            top: 25,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: COLORS.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class LineDrawingPainter extends CustomPainter {
  final List<Offset?> points;
  final Offset? startPoint;
  final Offset? endPoint;

  LineDrawingPainter(this.points, this.startPoint, this.endPoint);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = COLORS.primaryColor
      ..strokeWidth = 5.5
      ..strokeCap = StrokeCap.round;

    // Draw existing points
    for (int i = 0; i < points.length - 1; i += 2) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
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

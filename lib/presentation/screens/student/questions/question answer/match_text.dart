import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';

class MatchingQuiz extends StatefulWidget {
  @override
  _MatchingQuizState createState() => _MatchingQuizState();
}

class _MatchingQuizState extends State<MatchingQuiz> {
  final List<String> rightItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];
  final List<String> leftItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];

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
                          onTap: () => setStartPoint(index, 'left'),
                          child: ItemMatchTextR(item: item),
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
                          onTap: () => setEndPoint(index, 'right'),
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
              setState(() {
                points.add(endPoint!);
                startPoint = null;
                endPoint = null;
              });
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

  void setStartPoint(int index, String side) {
    final key = side == 'left' ? leftItemKeys[index] : rightItemKeys[index];
    final keyContext = key.currentContext;
    if (keyContext != null) {
      final box = keyContext.findRenderObject() as RenderBox?;
      if (box != null) {
        final position = box.localToGlobal(Offset.zero, ancestor: keyContext.findRenderObject());
        setState(() {
          startPoint = Offset(position.dx + box.size.width / 2, position.dy + box.size.height / 2);
        });
      }
    }
  }

  void setEndPoint(int index, String side) {
    final key = side == 'left' ? leftItemKeys[index] : rightItemKeys[index];
    final keyContext = key.currentContext;
    if (keyContext != null) {
      final box = keyContext.findRenderObject() as RenderBox?;
      if (box != null) {
        final position = box.localToGlobal(Offset.zero, ancestor: keyContext.findRenderObject());
        setState(() {
          endPoint = Offset(position.dx + box.size.width / 2, position.dy + box.size.height / 2);
        });
      }
    }
    if (startPoint != null && endPoint != null) {
      setState(() {
        points.add(startPoint);
        points.add(endPoint);
        startPoint = null;
        endPoint = null;
      });
    }
  }

  int? getClosestItemIndex(List<GlobalKey> keys, Offset point) {
    for (int i = 0; i < keys.length; i++) {
      final keyContext = keys[i].currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero, ancestor: keyContext.findRenderObject());
          final size = box.size;
          final rect = Rect.fromLTWH(position.dx, position.dy, size.width, size.height);
          if (rect.contains(point)) {
            return i;
          }
        }
      }
    }
    return null;
  }
}

class ItemMatchTextR extends StatelessWidget {
  final dynamic item;
  const ItemMatchTextR({super.key, this.item});

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
            child: CustomText(
              text: item,
              fontSize: 20,
              color: Color.fromRGBO(96, 96, 96, 1),
              fontWeight: FontWeight.w500,
            ),
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

// class MyWidgetMatch extends StatelessWidget {
//   MyWidgetMatch({super.key});
//   List<String> listAnswerRight = ['bell', 'book', 'home', 'google'];
//   List<String> listAnswerleft = ['bell', 'book', 'home', 'google'];

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: ThemeData(scaffoldBackgroundColor: Colors.white),
//       child: Container(
//         height: 400.h,
//         width: Get.width,
//         child: QuizMatcher(
//           questions: [
//             Container(
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: Colors.black)),
//               width: 100,
//               height: 50,
//               child: Text(listAnswerRight[0]),
//             ),
//             Container(
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: Colors.black)),
//               width: 100,
//               height: 50,
//               child: Text(listAnswerRight[1]),
//             ),
//             Container(
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: Colors.black)),
//               width: 100,
//               height: 50,
//               child: Text(listAnswerRight[2]),
//             ),
//             Container(
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: Colors.black)),
//               width: 100,
//               height: 50,
//               child: Text(listAnswerRight[3]),
//             ),
//           ],
//           answers: [
//             Container(
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: Colors.black)),
//               width: 100,
//               height: 50,
//               child: Text(listAnswerleft[0]),
//             ),
//             Container(
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: Colors.black)),
//               width: 100,
//               height: 50,
//               child: Text(listAnswerleft[1]),
//             ),
//             Container(
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: Colors.black)),
//               width: 100,
//               height: 50,
//               child: Text(listAnswerleft[2]),
//             ),
//             Container(
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: Colors.black)),
//               width: 100,
//               height: 50,
//               child: Text(listAnswerleft[3]),
//             ),
//           ],
//           defaultLineColor: Colors.red,
//           correctLineColor: Colors.green,
//           incorrectLineColor: Colors.red,
//           drawingLineColor: Colors.red,
//           onScoreUpdated: (UserScore userAnswers) {
//             if (kDebugMode) {
//               print(userAnswers.questionIndex);
//             }
//             if (kDebugMode) {
//               print(userAnswers.questionAnswer);
//             }
//           },
//           paddingAround: const EdgeInsets.all(8),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:shater/presentation/screens/base/text_custom.dart';
// import 'package:shater/util/color.dart';

// class MatchingQuiz extends StatefulWidget {
//   @override
//   _MatchingQuizState createState() => _MatchingQuizState();
// }

// class _MatchingQuizState extends State<MatchingQuiz> with TickerProviderStateMixin {
//   final List<String> rightItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];
//   final List<String> leftItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];

//   List<Offset?> points = [];
//   Offset? startPoint;
//   Offset? endPoint;

//   Map<String, String> matchedItems = {};

//   List<GlobalKey> leftItemKeys = List.generate(4, (_) => GlobalKey());
//   List<GlobalKey> rightItemKeys = List.generate(4, (_) => GlobalKey());

//   AnimationController? _lineAnimationController;

//   bool isDrawing = false;

//   @override
//   Widget build(BuildContext context) {
//     matchedItems;
//     return Container(
//       height: 400,
//       width: MediaQuery.of(context).size.width,
//       margin: EdgeInsets.symmetric(horizontal: 16),
//       child: Stack(
//         children: [
//           Column(
//             children: [
//               Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: leftItems.asMap().entries.map((entry) {
//                         final index = entry.key;
//                         final item = entry.value;
//                         return GestureDetector(
//                           key: leftItemKeys[index],
//                           child: ItemMatchTextR(item: item),
//                         );
//                       }).toList(),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: rightItems.asMap().entries.map((entry) {
//                         final index = entry.key;
//                         final item = entry.value;
//                         return GestureDetector(
//                           key: rightItemKeys[index],
//                           child: ItemMatchText(item: item),
//                         );
//                       }).toList(),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           GestureDetector(
//             onPanStart: (details) {
//               RenderBox? renderBox = context.findRenderObject() as RenderBox?;
//               if (renderBox != null) {
//                 startPoint = renderBox.globalToLocal(details.globalPosition);
//                 isDrawing = true;
//                 setState(() {});
//               }
//             },
//             onPanUpdate: (details) {
//               RenderBox? renderBox = context.findRenderObject() as RenderBox?;
//               if (renderBox != null && startPoint != null) {
//                 endPoint = renderBox.globalToLocal(details.globalPosition);
//                 setState(() {});
//               }
//             },
//             onPanEnd: (details) {
//               if (isDrawing) {
//                 isDrawing = false;
//                 if (checkMatch()) {
//                   _lineAnimationController =
//                       AnimationController(vsync: this, duration: Duration(milliseconds: 500));
//                   _lineAnimationController!.forward();
//                 }
//                 setState(() {
//                   points.add(endPoint!);
//                   startPoint = null;
//                   endPoint = null;
//                 });
//               }
//             },
//             child: CustomPaint(
//               painter: LineDrawingPainter(points, startPoint, endPoint),
//               child: Container(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   bool checkMatch() {
//     if (endPoint != null) {
//       final leftBox =
//           leftItemKeys[getItemIndex(endPoint!, leftItems)].currentContext!.findRenderObject() as RenderBox?;
//       final rightBox =
//           rightItemKeys[getItemIndex(endPoint!, rightItems)].currentContext!.findRenderObject() as RenderBox?;
//       if (leftBox != null && rightBox != null) {
//         final leftItem = leftItems[getItemIndex(endPoint!, leftItems)];
//         final rightItem = rightItems[getItemIndex(endPoint!, rightItems)];

//         // Collision detection using hitTest
//         final leftHit = hitTestItemBox(endPoint!, leftBox);
//         final rightHit = hitTestItemBox(endPoint!, rightBox);

//         if (leftHit && rightHit) {
//           // Update matched items
//           matchedItems[leftItem] = rightItem;
//           return true;
//         }
//       }
//     }
//     return false;
//   }

//   bool hitTestItemBox(Offset point, RenderBox box) {
//     final hitTestResult = BoxHitTestResult();
//     box.hitTest(hitTestResult, position: point);
//     return hitTestResult.path.isNotEmpty;
//   }

//   int getItemIndex(Offset point, List<String> items) {
//     final RenderBox? box = context.findRenderObject() as RenderBox?;
//     if (box != null) {
//       for (int i = 0; i < items.length; i++) {
//         final itemBox = leftItemKeys[i].currentContext!.findRenderObject() as RenderBox?;
//         if (itemBox != null) {
//           final convertedPoint = box.globalToLocal(point);
//           if (hitTestItemBox(convertedPoint, itemBox)) {
//             return i;
//           }
//         }
//       }
//     }
//     return -1; // Not found
//   }
// }

// class ItemMatchTextR extends StatelessWidget {
//   final dynamic item;
//   const ItemMatchTextR({super.key, this.item});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 120,
//       child: Stack(
//         children: [
//           Container(
//             height: 60,
//             width: 110,
//             alignment: Alignment.center,
//             margin: EdgeInsets.only(bottom: 6),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(13),
//               border: Border.all(width: 3.5, color: const Color.fromARGB(255, 13, 36, 54)),
//             ),
//             child: CustomText(
//               text: item,
//               fontSize: 18,
//               color: Color.fromRGBO(96, 96, 96, 1),
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           Positioned(
//             left: 2.5,
//             top: 20,
//             child: CircleAvatar(
//               radius: 9,
//               backgroundColor: COLORS.primaryColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ItemMatchText extends StatelessWidget {
//   final dynamic item;
//   const ItemMatchText({super.key, this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 120,
//       alignment: Alignment.centerLeft,
//       child: Stack(
//         children: [
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Container(
//               height: 60,
//               width: 110,
//               alignment: Alignment.center,
//               margin: EdgeInsets.only(bottom: 6),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(13),
//                 border: Border.all(width: 3.5, color: COLORS.primaryColor),
//               ),
//               child: CustomText(
//                 text: item,
//                 fontSize: 18,
//                 color: Color.fromRGBO(96, 96, 96, 1),
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           Positioned(
//             right: 2.2,
//             top: 20,
//             child: CircleAvatar(
//               radius: 9,
//               backgroundColor: COLORS.primaryColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class LineDrawingPainter extends CustomPainter {
//   final List<Offset?> points;
//   final Offset? startPoint;
//   final Offset? endPoint;

//   LineDrawingPainter(this.points, this.startPoint, this.endPoint);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = COLORS.primaryColor
//       ..strokeWidth = 5.5
//       ..strokeCap = StrokeCap.round;

//     // Draw existing points
//     for (int i = 0; i < points.length - 1; i += 2) {
//       if (points[i] != null && points[i + 1] != null) {
//         canvas.drawLine(points[i]!, points[i + 1]!, paint);
//       }
//     }

//     // Draw the current line being panned
//     if (startPoint != null && endPoint != null) {
//       canvas.drawLine(startPoint!, endPoint!, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_matcher/flutter_quiz_matcher.dart';
import 'package:flutter_quiz_matcher/models/model.dart';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});
  final List<String> rightItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];
  final List<String> leftItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: QuizMatcher(
        questions: List.generate(
          rightItems.length,
          (index) => Container(
            decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
            width: 100,
            height: 50,
            child: Text(rightItems[index]),
          ),
        ),
        answers: List.generate(
          rightItems.length,
          (index) => Container(
            decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
            width: 100,
            height: 50,
            child: Text(leftItems[index]),
          ),
        ),
        defaultLineColor: Colors.black,
        correctLineColor: Colors.green,
        incorrectLineColor: Colors.red,
        drawingLineColor: Colors.black,
        onScoreUpdated: (UserScore userAnswers) {
          if (kDebugMode) {
            print(userAnswers.questionIndex);
          }
          if (kDebugMode) {
            print(userAnswers.questionAnswer);
          }
        },
        paddingAround: const EdgeInsets.all(8),
      ),
    );
  }
}

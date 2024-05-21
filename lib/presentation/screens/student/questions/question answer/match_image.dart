import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quiz_matcher/models/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:flutter_quiz_matcher/flutter_quiz_matcher.dart';
import 'package:painter/painter.dart';

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

// class MatchingQuizScreen extends StatefulWidget {
//   @override
//   _MatchingQuizScreenState createState() => _MatchingQuizScreenState();
// }

// class _MatchingQuizScreenState extends State<MatchingQuizScreen> {
//   final List<String> leftItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];
//   final List<String> rightItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];
//   // final List<String> rightItems = [
//   //   'assets/goose.png',
//   //   'assets/butterfly.png',
//   //   'assets/horse.png',
//   //   'assets/rabbit.png'
//   // ];

//   Offset? start;
//   Offset? end;

//   final Map<String, Offset> leftPositions = {};
//   final Map<String, Offset> rightPositions = {};
//   final Map<String, String> matches = {};

//   void onPanStart(DragStartDetails details) {
//     start = details.localPosition;
//     setState(() {});
//   }

//   void onPanUpdate(DragUpdateDetails details) {
//     end = details.localPosition;
//     setState(() {});
//   }

//   void onPanEnd(DragEndDetails details) {
//     if (start != null && end != null) {
//       String? matchedLeftItem;
//       String? matchedRightItem;

//       leftPositions.forEach((key, value) {
//         if ((value - start!).distance < 30) {
//           matchedLeftItem = key;
//         }
//       });

//       rightPositions.forEach((key, value) {
//         if ((value - end!).distance < 30) {
//           matchedRightItem = key;
//         }
//       });

//       if (matchedLeftItem != null && matchedRightItem != null) {
//         setState(() {
//           matches[matchedLeftItem!] = matchedRightItem!;
//         });
//       }
//     }

//     start = null;
//     end = null;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 350,
//       width: Get.width,
//       margin: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
//       child: Stack(
//         children: [
//           Center(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: leftItems.map((item) {
//                     return Container(
//                       child: GestureDetector(
//                         onPanStart: onPanStart,
//                         onPanUpdate: onPanUpdate,
//                         onPanEnd: onPanEnd,
//                         child: Container(
//                           height: 70,
//                           width: 110,
//                           alignment: Alignment.center,
//                           margin:
//                               EdgeInsets.only(bottom: Dimensions.paddingSize10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(13),
//                             border: Border.all(
//                                 width: 2.5, color: COLORS.primaryColor),
//                           ),
//                           child: CustomText(
//                             text: item,
//                             fontSize: Dimensions.fontSize15,
//                             color: Color.fromRGBO(96, 96, 96, 1),
//                             maxLine: 1,
//                             textAlign: TextAlign.center,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         onTapDown: (details) {
//                           RenderBox box =
//                               context.findRenderObject() as RenderBox;
//                           leftPositions[item] =
//                               box.localToGlobal(details.localPosition);
//                         },
//                       ),
//                     );
//                   }).toList(),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: rightItems.map((item) {
//                     return Container(
//                       child: GestureDetector(
//                         onPanStart: onPanStart,
//                         onPanUpdate: onPanUpdate,
//                         onPanEnd: onPanEnd,
//                         child: Container(
//                           height: 70,
//                           width: 110,
//                           margin:
//                               EdgeInsets.only(bottom: Dimensions.paddingSize10),
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(13),
//                             border: Border.all(
//                                 width: 2.5, color: COLORS.primaryColor),
//                           ),
//                           child: CustomText(
//                             text: item,
//                             fontSize: Dimensions.fontSize15,
//                             color: Color.fromRGBO(96, 96, 96, 1),
//                             maxLine: 1,
//                             textAlign: TextAlign.center,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         onTapDown: (details) {
//                           RenderBox box =
//                               context.findRenderObject() as RenderBox;
//                           rightPositions[item] =
//                               box.localToGlobal(details.localPosition);
//                         },
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ],
//             ),
//           ),
//           CustomPaint(
//             size: Size.infinite,
//             painter:
//                 LinePainter(start, end, leftPositions, rightPositions, matches),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class LinePainter extends CustomPainter {
//   final Offset? start;
//   final Offset? end;
//   final Map<String, Offset> leftPositions;
//   final Map<String, Offset> rightPositions;
//   final Map<String, String> matches;

//   LinePainter(this.start, this.end, this.leftPositions, this.rightPositions,
//       this.matches);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.blue
//       ..strokeWidth = 2.0
//       ..strokeCap = StrokeCap.round;

//     if (start != null && end != null) {
//       canvas.drawLine(start!, end!, paint);
//     }

//     matches.forEach((left, right) {
//       final leftPosition = leftPositions[left];
//       final rightPosition = rightPositions[right];
//       if (leftPosition != null && rightPosition != null) {
//         canvas.drawLine(leftPosition, rightPosition, paint);
//       }
//     });
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart'; // Assuming Get package is used for screen width
// import 'dimensions.dart'; // Assuming you have this file for custom dimensions
// import 'colors.dart'; // Assuming you have this file for custom colors
// import 'custom_text.dart'; // Assuming you have this file for custom text widget

// class MatchingQuizScreen extends StatefulWidget {
//   @override
//   _MatchingQuizScreenState createState() => _MatchingQuizScreenState();
// }

// class _MatchingQuizScreenState extends State<MatchingQuizScreen> {
//   final List<String> leftItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];
//   final List<String> rightItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];

//   Offset? start;
//   Offset? end;

//   final Map<String, Offset> leftPositions = {};
//   final Map<String, Offset> rightPositions = {};
//   final Map<String, String> matches = {};

//   void onPanStart(DragStartDetails details) {
//     start = details.localPosition;
//     setState(() {});
//   }

//   void onPanUpdate(DragUpdateDetails details) {
//     end = details.localPosition;
//     setState(() {});
//   }

//   void onPanEnd(DragEndDetails details) {
//     if (start != null && end != null) {
//       String? matchedLeftItem;
//       String? matchedRightItem;

//       leftPositions.forEach((key, value) {
//         if ((value - start!).distance < 30) {
//           matchedLeftItem = key;
//         }
//       });

//       rightPositions.forEach((key, value) {
//         if ((value - end!).distance < 30) {
//           matchedRightItem = key;
//         }
//       });

//       if (matchedLeftItem != null && matchedRightItem != null) {
//         setState(() {
//           matches[matchedLeftItem!] = matchedRightItem!;
//         });
//       }
//     }

//     start = null;
//     end = null;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 400.h,
//       width: Get.width,
//       margin: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
//       child: Stack(
//         children: [
//           Center(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: leftItems.map((item) {
//                     return GestureDetector(
//                       onPanStart: onPanStart,
//                       onPanUpdate: onPanUpdate,
//                       onPanEnd: onPanEnd,
//                       onTapDown: (details) {
//                         RenderBox box = context.findRenderObject() as RenderBox;
//                         leftPositions[item] =
//                             box.localToGlobal(details.localPosition);
//                       },
//                       child: Container(
//                         height: 70,
//                         width: 110,
//                         alignment: Alignment.center,
//                         margin:
//                             EdgeInsets.only(bottom: Dimensions.paddingSize10),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(13),
//                           border: Border.all(
//                               width: 2.5, color: COLORS.primaryColor),
//                         ),
//                         child: CustomText(
//                           text: item,
//                           fontSize: Dimensions.fontSize15,
//                           color: Color.fromRGBO(96, 96, 96, 1),
//                           maxLine: 1,
//                           textAlign: TextAlign.center,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: rightItems.map((item) {
//                     return GestureDetector(
//                       onPanStart: onPanStart,
//                       onPanUpdate: onPanUpdate,
//                       onPanEnd: onPanEnd,
//                       onTapDown: (details) {
//                         RenderBox box = context.findRenderObject() as RenderBox;
//                         rightPositions[item] =
//                             box.localToGlobal(details.localPosition);
//                       },
//                       child: Container(
//                         height: 70,
//                         width: 110,
//                         alignment: Alignment.center,
//                         margin:
//                             EdgeInsets.only(bottom: Dimensions.paddingSize10),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(13),
//                           border: Border.all(
//                               width: 2.5, color: COLORS.primaryColor),
//                         ),
//                         child: CustomText(
//                           text: item,
//                           fontSize: Dimensions.fontSize15,
//                           color: Color.fromRGBO(96, 96, 96, 1),
//                           maxLine: 1,
//                           textAlign: TextAlign.center,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ],
//             ),
//           ),
//           CustomPaint(
//             size: Size.infinite,
//             painter:
//                 LinePainter(start, end, leftPositions, rightPositions, matches),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class LinePainter extends CustomPainter {
//   final Offset? start;
//   final Offset? end;
//   final Map<String, Offset> leftPositions;
//   final Map<String, Offset> rightPositions;
//   final Map<String, String> matches;

//   LinePainter(this.start, this.end, this.leftPositions, this.rightPositions,
//       this.matches);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.blue
//       ..strokeWidth = 2.0;

//     // Draw lines for ongoing drag
//     if (start != null && end != null) {
//       canvas.drawLine(start!, end!, paint);
//     }

//     // Draw lines for matched items
//     matches.forEach((left, right) {
//       if (leftPositions[left] != null && rightPositions[right] != null) {
//         canvas.drawLine(leftPositions[left]!, rightPositions[right]!, paint);
//       }
//     });
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true; // Redraw every time
//   }
// }
// import 'package:flutter/material.dart';

// class MatchingQuizScreen extends StatefulWidget {
//   @override
//   _MatchingQuizScreenState createState() => _MatchingQuizScreenState();
// }

// class _MatchingQuizScreenState extends State<MatchingQuizScreen> {
//   final List<String> leftItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];
//   final List<String> rightItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];

//   Offset? start;
//   Offset? end;

//   final Map<String, Offset> leftPositions = {};
//   final Map<String, Offset> rightPositions = {};
//   final Map<String, String> matches = {};

//   void onPanStart(DragStartDetails details, String item, bool isLeft) {
//     final RenderBox renderBox = context.findRenderObject() as RenderBox;
//     Offset localPosition = renderBox.globalToLocal(details.globalPosition);
//     setState(() {
//       start = localPosition;
//       if (isLeft) {
//         leftPositions[item] = localPosition;
//       } else {
//         rightPositions[item] = localPosition;
//       }
//     });
//   }

//   void onPanUpdate(DragUpdateDetails details) {
//     final RenderBox renderBox = context.findRenderObject() as RenderBox;
//     setState(() {
//       end = renderBox.globalToLocal(details.globalPosition);
//     });
//   }

//   void onPanEnd(DragEndDetails details, String item, bool isLeft) {
//     final RenderBox renderBox = context.findRenderObject() as RenderBox;
//     Offset localPosition =
//         renderBox.globalToLocal(details.velocity.pixelsPerSecond);

//     String? matchedLeftItem;
//     String? matchedRightItem;

//     if (isLeft) {
//       leftPositions.forEach((key, value) {
//         if ((value - start!).distance < 30) {
//           matchedLeftItem = key;
//         }
//       });
//       rightPositions.forEach((key, value) {
//         if ((value - end!).distance < 30) {
//           matchedRightItem = key;
//         }
//       });
//     } else {
//       rightPositions.forEach((key, value) {
//         if ((value - start!).distance < 30) {
//           matchedRightItem = key;
//         }
//       });
//       leftPositions.forEach((key, value) {
//         if ((value - end!).distance < 30) {
//           matchedLeftItem = key;
//         }
//       });
//     }

//     if (matchedLeftItem != null && matchedRightItem != null) {
//       setState(() {
//         matches[matchedLeftItem!] = matchedRightItem!;
//       });
//     }

//     setState(() {
//       start = null;
//       end = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 400.h,
//       width: MediaQuery.of(context).size.width,
//       margin: EdgeInsets.symmetric(horizontal: 16),
//       child: Stack(
//         children: [
//           Container(
//             width: Get.width,
//             height: 400.h,
//             child: Column(
//               children: [
//                 Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: leftItems.map((item) {
//                           return GestureDetector(
//                             onPanStart: (details) =>
//                                 onPanStart(details, item, true),
//                             onPanUpdate: onPanUpdate,
//                             onPanEnd: (details) =>
//                                 onPanEnd(details, item, true),
//                             child: Container(
//                               height: 70,
//                               width: 110,
//                               alignment: Alignment.center,
//                               margin: EdgeInsets.only(bottom: 10),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(13),
//                                 border:
//                                     Border.all(width: 2.5, color: Colors.blue),
//                               ),
//                               child: Text(
//                                 item,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   color: Color.fromRGBO(96, 96, 96, 1),
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: rightItems.map((item) {
//                           return GestureDetector(
//                             onPanStart: (details) =>
//                                 onPanStart(details, item, false),
//                             onPanUpdate: onPanUpdate,
//                             onPanEnd: (details) =>
//                                 onPanEnd(details, item, false),
//                             child: Container(
//                               height: 70,
//                               width: 110,
//                               alignment: Alignment.center,
//                               margin: EdgeInsets.only(bottom: 10),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(13),
//                                 border:
//                                     Border.all(width: 2.5, color: Colors.blue),
//                               ),
//                               child: Text(
//                                 item,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   color: Color.fromRGBO(96, 96, 96, 1),
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ],
//                   ),
//                 ),
//                 CustomPaint(
//                   size: Size.infinite,
//                   painter: LinePainter(
//                       start, end, leftPositions, rightPositions, matches),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class LinePainter extends CustomPainter {
//   final Offset? start;
//   final Offset? end;
//   final Map<String, Offset> leftPositions;
//   final Map<String, Offset> rightPositions;
//   final Map<String, String> matches;

//   LinePainter(this.start, this.end, this.leftPositions, this.rightPositions,
//       this.matches);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.blue
//       ..strokeWidth = 2.0;

//     // Draw lines for ongoing drag
//     if (start != null && end != null) {
//       canvas.drawLine(start!, end!, paint);
//     }

//     // Draw lines for matched items
//     matches.forEach((left, right) {
//       if (leftPositions[left] != null && rightPositions[right] != null) {
//         canvas.drawLine(leftPositions[left]!, rightPositions[right]!, paint);
//       }
//     });
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true; // Redraw every time
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:painter/painter.dart';

class MatchingQuizScreen extends StatefulWidget {
  @override
  _MatchingQuizScreenState createState() => _MatchingQuizScreenState();
}

class _MatchingQuizScreenState extends State<MatchingQuizScreen> {
  final List<String> leftItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];
  final List<String> rightItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];

  Offset? start;
  Offset? end;

  final Map<String, Offset> leftPositions = {};
  final Map<String, Offset> rightPositions = {};
  final Map<String, String> matches = {};

  PainterController? painterController;

  @override
  void initState() {
    super.initState();
    painterController = PainterController()
      ..backgroundColor = Colors.transparent
      ..thickness = 3.0
      ..drawColor = Colors.red;
  }

  void onPanStart(DragStartDetails details, bool isLeft) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset localPosition = renderBox.globalToLocal(details.globalPosition);
    setState(() {
      start = localPosition;
    });
  }

  void onPanUpdate(DragUpdateDetails details) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    setState(() {
      end = renderBox.globalToLocal(details.globalPosition);
      drawCurrentLine();
    });
  }

  void onPanEnd(DragEndDetails details) {
    if (start != null && end != null) {
      String? matchedLeftItem;
      String? matchedRightItem;

      leftPositions.forEach((key, value) {
        if ((value - start!).distance < 30) {
          matchedLeftItem = key;
        }
      });

      rightPositions.forEach((key, value) {
        if ((value - end!).distance < 30) {
          matchedRightItem = key;
        }
      });

      if (matchedLeftItem != null && matchedRightItem != null) {
        setState(() {
          matches[matchedLeftItem!] = matchedRightItem!;
        });
      }
    }

    setState(() {
      start = null;
      end = null;
    });
    drawAllLines();
  }

  void drawCurrentLine() {
    if (painterController != null && start != null && end != null) {
      painterController!.clear();
      painterController!.drawColor = Colors.red;
      painterController!.thickness = 3.0;
      painterController!.backgroundColor = Colors.transparent;
      // painterController!.mode = PainterMode.freeStyle;
      // painterController!.draw(start!, end!);
    }
  }

  void drawAllLines() {
    if (painterController != null) {
      painterController!.clear();
      final List<Offset> lines = [];
      matches.forEach((left, right) {
        if (leftPositions[left] != null && rightPositions[right] != null) {
          final Offset leftCircleCenter = leftPositions[left]!;
          final Offset rightCircleCenter = rightPositions[right]!;
          lines.add(leftCircleCenter);
          lines.add(rightCircleCenter);
        }
      });

      // for (int i = 0; i < lines.length; i += 2) {
      //   painterController!.draw(lines[i], lines[i + 1]);
      // }
    }
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
                      children: leftItems.map((item) {
                        return GestureDetector(
                          onTapDown: (details) {
                            RenderBox box =
                                context.findRenderObject() as RenderBox;
                            final Offset tappedPoint =
                                box.globalToLocal(details.globalPosition);
                            final RenderBox itemBox =
                                details.localPosition.dx < box.size.width / 2
                                    ? box
                                    : box;
                            setState(() {
                              leftPositions[item] =
                                  itemBox.globalToLocal(tappedPoint) +
                                      Offset(0, -35);
                            });
                          },
                          onPanStart: (details) => onPanStart(details, true),
                          onPanUpdate: onPanUpdate,
                          onPanEnd: onPanEnd,
                          child: Container(
                            height: 70,
                            width: 110,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              border:
                                  Border.all(width: 2.5, color: Colors.blue),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: -15,
                                  top: 25,
                                  child: CircleAvatar(
                                    radius: 10,
                                    // backgroundColor: C,
                                  ),
                                ),
                                Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(96, 96, 96, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: rightItems.map((item) {
                        return GestureDetector(
                          onTapDown: (details) {
                            RenderBox box =
                                context.findRenderObject() as RenderBox;
                            final Offset tappedPoint =
                                box.globalToLocal(details.globalPosition);
                            final RenderBox itemBox =
                                details.localPosition.dx > box.size.width / 2
                                    ? box
                                    : box;
                            setState(() {
                              rightPositions[item] =
                                  itemBox.globalToLocal(tappedPoint) +
                                      Offset(0, -35);
                            });
                          },
                          onPanStart: (details) => onPanStart(details, false),
                          onPanUpdate: onPanUpdate,
                          onPanEnd: onPanEnd,
                          child: Container(
                            height: 70,
                            width: 110,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              border:
                                  Border.all(width: 2.5, color: Colors.blue),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: -15,
                                  top: 25,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(96, 96, 96, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),

// class MatchingQuizScreen extends StatefulWidget {
//   @override
//   _MatchingQuizScreenState createState() => _MatchingQuizScreenState();
// }

// class _MatchingQuizScreenState extends State<MatchingQuizScreen> {
//   final List<String> leftItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];
//   final List<String> rightItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];

//   Offset? start;
//   Offset? end;

//   final Map<String, Offset> leftPositions = {};
//   final Map<String, Offset> rightPositions = {};
//   final Map<String, String> matches = {};

//   PainterController? painterController;

//   @override
//   void initState() {
//     super.initState();
//     painterController = PainterController()
//       ..backgroundColor = Colors.transparent
//       ..thickness = 3.0
//       ..drawColor = Colors.red;
//   }

//   void onPanStart(DragStartDetails details, bool isLeft) {
//     final RenderBox renderBox = context.findRenderObject() as RenderBox;
//     Offset localPosition = renderBox.globalToLocal(details.globalPosition);
//     setState(() {
//       start = localPosition;
//     });
//   }

//   void onPanUpdate(DragUpdateDetails details) {
//     final RenderBox renderBox = context.findRenderObject() as RenderBox;
//     setState(() {
//       end = renderBox.globalToLocal(details.globalPosition);
//       drawCurrentLine();
//     });
//   }

//   void onPanEnd(DragEndDetails details) {
//     if (start != null && end != null) {
//       String? matchedLeftItem;
//       String? matchedRightItem;

//       leftPositions.forEach((key, value) {
//         if ((value - start!).distance < 30) {
//           matchedLeftItem = key;
//         }
//       });

//       rightPositions.forEach((key, value) {
//         if ((value - end!).distance < 30) {
//           matchedRightItem = key;
//         }
//       });

//       if (matchedLeftItem != null && matchedRightItem != null) {
//         setState(() {
//           matches[matchedLeftItem!] = matchedRightItem!;
//         });
//       }
//     }

//     setState(() {
//       start = null;
//       end = null;
//     });
//     drawAllLines();
//   }

//   void drawCurrentLine() {
//     if (painterController != null && start != null && end != null) {
//       painterController!.clear();
//       painterController!.drawColor = Colors.red;
//       painterController!.thickness = 5.0;
//       painterController!.backgroundColor = Colors.transparent;
//       // painterController!.mode = PainterMode.freeStyle;
//       // painterController!.draw(start!, end!);
//     }
//   }

//   void drawAllLines() {
//     if (painterController != null) {
//       painterController!.clear();
//       final List<Offset> lines = [];
//       matches.forEach((left, right) {
//         if (leftPositions[left] != null && rightPositions[right] != null) {
//           lines.add(leftPositions[left]!);
//           lines.add(rightPositions[right]!);
//         }
//       });

//       // for (int i = 0; i < lines.length; i += 2) {
//       //   painterController!.draw(lines[i], lines[i + 1]);
//       // }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
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
//                       children: leftItems.map((item) {
//                         return GestureDetector(
//                           onTapDown: (details) {
//                             RenderBox box =
//                                 context.findRenderObject() as RenderBox;
//                             final Offset tappedPoint =
//                                 box.globalToLocal(details.globalPosition);
//                             final RenderBox itemBox =
//                                 details.localPosition.dx < box.size.width / 2
//                                     ? box
//                                     : box;
//                             setState(() {
//                               leftPositions[item] =
//                                   itemBox.globalToLocal(tappedPoint) +
//                                       Offset(0, -35);
//                             });
//                           },
//                           onPanStart: (details) => onPanStart(details, true),
//                           onPanUpdate: onPanUpdate,
//                           onPanEnd: onPanEnd,
//                           child: Container(
//                             height: 70,
//                             width: 110,
//                             alignment: Alignment.center,
//                             margin: EdgeInsets.only(bottom: 10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(13),
//                               border:
//                                   Border.all(width: 2.5, color: Colors.blue),
//                             ),
//                             child: Text(
//                               item,
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 color: Color.fromRGBO(96, 96, 96, 1),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: rightItems.map((item) {
//                         return GestureDetector(
//                           onTapDown: (details) {
//                             RenderBox box =
//                                 context.findRenderObject() as RenderBox;
//                             final Offset tappedPoint =
//                                 box.globalToLocal(details.globalPosition);
//                             final RenderBox itemBox =
//                                 details.localPosition.dx > box.size.width / 2
//                                     ? box
//                                     : box;
//                             setState(() {
//                               rightPositions[item] =
//                                   itemBox.globalToLocal(tappedPoint) +
//                                       Offset(0, -35);
//                             });
//                           },
//                           onPanStart: (details) => onPanStart(details, false),
//                           onPanUpdate: onPanUpdate,
//                           onPanEnd: onPanEnd,
//                           child: Container(
//                             height: 70,
//                             width: 110,
//                             alignment: Alignment.center,
//                             margin: EdgeInsets.only(bottom: 10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(13),
//                               border:
//                                   Border.all(width: 2.5, color: Colors.blue),
//                             ),
//                             child: Text(
//                               item,
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 color: Color.fromRGBO(96, 96, 96, 1),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
          Positioned.fill(
            child: Painter(
              painterController!,
            ),
          ),
        ],
      ),
    );
  }
}

//dsdsd
// class MatchingQuizScreen extends StatefulWidget {
//   @override
//   _MatchingQuizScreenState createState() => _MatchingQuizScreenState();
// }

// class _MatchingQuizScreenState extends State<MatchingQuizScreen> {
//   final List<String> leftItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];
//   final List<String> rightItems = ['حصان', 'أرنب', 'بطة', 'فراشة'];

//   Offset? start;
//   Offset? end;

//   final Map<String, Offset> leftPositions = {};
//   final Map<String, Offset> rightPositions = {};
//   final Map<String, String> matches = {};

//   PainterController? painterController;

//   @override
//   void initState() {
//     super.initState();
//     painterController = PainterController()
//       ..backgroundColor = Colors.transparent
//       ..thickness = 3.0
//       ..drawColor = Colors.red;
//     // ..mode = PainterMode.freeStyle;
//   }

//   void onPanStart(DragStartDetails details, bool isLeft) {
//     final RenderBox renderBox = context.findRenderObject() as RenderBox;
//     Offset localPosition = renderBox.globalToLocal(details.globalPosition);
//     setState(() {
//       start = localPosition;
//     });
//   }

//   void onPanUpdate(DragUpdateDetails details) {
//     final RenderBox renderBox = context.findRenderObject() as RenderBox;
//     setState(() {
//       end = renderBox.globalToLocal(details.globalPosition);
//       drawCurrentLine();
//     });
//   }

//   void onPanEnd(DragEndDetails details) {
//     if (start != null && end != null) {
//       String? matchedLeftItem;
//       String? matchedRightItem;

//       leftPositions.forEach((key, value) {
//         if ((value - start!).distance < 30) {
//           matchedLeftItem = key;
//         }
//       });

//       rightPositions.forEach((key, value) {
//         if ((value - end!).distance < 30) {
//           matchedRightItem = key;
//         }
//       });

//       if (matchedLeftItem != null && matchedRightItem != null) {
//         setState(() {
//           matches[matchedLeftItem!] = matchedRightItem!;
//         });
//       }
//     }

//     setState(() {
//       start = null;
//       end = null;
//     });
//     drawAllLines();
//   }

//   void drawCurrentLine() {
//     if (painterController != null && start != null && end != null) {
//       painterController!.clear();
//       painterController!.drawColor = Colors.red;
//       painterController!.thickness = 3.0;
//       painterController!.backgroundColor = Colors.transparent;
//       // painterController!.mode = PainterMode.freeStyle;
//       // painterController!.draw(start!, end!);
//     }
//   }

//   void drawAllLines() {
//     if (painterController != null) {
//       painterController!.clear();
//       final List<Offset> lines = [];
//       matches.forEach((left, right) {
//         if (leftPositions[left] != null && rightPositions[right] != null) {
//           lines.add(leftPositions[left]!);
//           lines.add(rightPositions[right]!);
//         }
//       });

//       for (int i = 0; i < lines.length; i += 2) {
//         // painterController!.(lines[i], lines[i + 1]);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
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
//                       children: leftItems.map((item) {
//                         return GestureDetector(
//                           onTapDown: (details) {
//                             RenderBox box =
//                                 context.findRenderObject() as RenderBox;
//                             setState(() {
//                               leftPositions[item] =
//                                   box.globalToLocal(details.globalPosition);
//                             });
//                           },
//                           onPanStart: (details) => onPanStart(details, true),
//                           onPanUpdate: onPanUpdate,
//                           onPanEnd: onPanEnd,
//                           child: Container(
//                             height: 70,
//                             width: 110,
//                             alignment: Alignment.center,
//                             margin: EdgeInsets.only(bottom: 10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(13),
//                               border:
//                                   Border.all(width: 2.5, color: Colors.blue),
//                             ),
//                             child: Text(
//                               item,
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 color: Color.fromRGBO(96, 96, 96, 1),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: rightItems.map((item) {
//                         return GestureDetector(
//                           onTapDown: (details) {
//                             RenderBox box =
//                                 context.findRenderObject() as RenderBox;
//                             setState(() {
//                               rightPositions[item] =
//                                   box.globalToLocal(details.globalPosition);
//                             });
//                           },
//                           onPanStart: (details) => onPanStart(details, false),
//                           onPanUpdate: onPanUpdate,
//                           onPanEnd: onPanEnd,
//                           child: Container(
//                             height: 70,
//                             width: 110,
//                             alignment: Alignment.center,
//                             margin: EdgeInsets.only(bottom: 10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(13),
//                               border:
//                                   Border.all(width: 2.5, color: Colors.blue),
//                             ),
//                             child: Text(
//                               item,
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 color: Color.fromRGBO(96, 96, 96, 1),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Positioned.fill(
//             child: Painter(
//               painterController!,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class DrawScreen extends StatefulWidget {
  @override
  _DrawScreenState createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  PainterController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = _newController();
  }

  PainterController _newController() {
    PainterController controller = PainterController();
    controller.thickness = 5.0;
    controller.backgroundColor = Colors.white;
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 400, width: Get.width, child: Painter(_controller!)),
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () => setState(() {
            _controller = _newController();
          }),
        ),
      ],
    );
  }
}

class LinePainter extends CustomPainter {
  final Offset? start;
  final Offset? end;
  final Map<String, Offset> leftPositions;
  final Map<String, Offset> rightPositions;
  final Map<String, String> matches;

  LinePainter(this.start, this.end, this.leftPositions, this.rightPositions,
      this.matches);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0;

    // Draw lines for ongoing drag
    if (start != null && end != null) {
      canvas.drawLine(start!, end!, paint);
    }

    // Draw lines for matched items
    matches.forEach((left, right) {
      if (leftPositions[left] != null && rightPositions[right] != null) {
        canvas.drawLine(leftPositions[left]!, rightPositions[right]!, paint);
      }
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Redraw every time
  }
}

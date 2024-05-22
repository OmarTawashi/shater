import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:painter/painter.dart';
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
      ..eraseMode = true
      ..thickness = 6.0
      ..drawColor = COLORS.primaryColor;
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
      painterController!.drawColor = COLORS.primaryColor;
      painterController!.thickness = 6.0;
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
                          child: ItemMatchImage(
                            item: item,
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
                            child: ItemMatchText(
                              item: item,
                            ));
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Lines(),

          // Positioned.fill(
          //     child: Painter(
          //   painterController!,
          // )),
        ],
      ),
    );
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

class Lines extends StatefulWidget {
  const Lines({Key? key}) : super(key: key);

  @override
  createState() => _LinesState();
}

class _LinesState extends State<Lines> {
  Offset? start;
  Offset? end;

  @override
  build(_) => GestureDetector(
        onTap: () => print('t'),
        onPanStart: (details) {
          print(details.localPosition);
          setState(() {
            start = details.localPosition;
            end = null;
          });
        },
        onPanUpdate: (details) {
          setState(() {
            end = details.localPosition;
          });
        },
        child: CustomPaint(
          size: Size.infinite,
          painter: LinesPainter(start ?? Offset(0, 0), Offset(0, 0)),
        ),
      );
}

class LinesPainter extends CustomPainter {
  final Offset start, end;

  LinesPainter(this.start, this.end);

  @override
  void paint(Canvas canvas, Size size) {
    if (start == null || end == null) return;
    canvas.drawLine(
        start,
        end,
        Paint()
          ..strokeWidth = 4
          ..color = Colors.redAccent);
  }

  @override
  bool shouldRepaint(LinesPainter oldDelegate) {
    return oldDelegate.start != start || oldDelegate.end != end;
  }
}

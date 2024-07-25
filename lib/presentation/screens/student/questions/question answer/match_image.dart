
import 'package:flutter/material.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/presentation/screens/student/questions/question%20answer/match_text.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';

class MatchImage extends StatefulWidget {
  final QuestionController controller;
  const MatchImage({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  _MatchImageState createState() => _MatchImageState();
}

class _MatchImageState extends State<MatchImage> with TickerProviderStateMixin {
  List<Offset?> currentLine = [];
  List<List<Offset?>> lines = [];
  Offset? startPoint;
  Offset? endPoint;

  Offset? pointLeft;
  Offset? pointRight;

  Map<String, String> matchedItems = {};

  List<GlobalKey> leftItemKeys = List.generate(4, (_) => GlobalKey());
  List<GlobalKey> rightItemKeys = List.generate(4, (_) => GlobalKey());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.getListMatchItems();
  }

  @override
  Widget build(BuildContext context) {
    matchedItems;
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
                            isImage: true,
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
                            isImage: true,
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
                  _storeMatchedItems(startPoint!, endPoint!);
                  startPoint = null;
                  endPoint = null;
                });
                widget.controller.setQuestionStatus(QuestionStatusEnum.select);
              }
            },
          ),
        ],
      ),
    );
  }

  void _storeMatchedItems(Offset start, Offset end) {
    String? leftItem = _getIntersectedItem(leftItemKeys, widget.controller.leftItems, start);
    String? rightItem = _getIntersectedItem(rightItemKeys, widget.controller.rightItems, end);

    if (leftItem != null && rightItem != null) {
      setState(() {
        matchedItems[leftItem!] = rightItem!;
      });
    } else {
      leftItem = _getIntersectedItem(leftItemKeys, widget.controller.leftItems, end);
      rightItem = _getIntersectedItem(rightItemKeys, widget.controller.rightItems, start);
      if (leftItem != null && rightItem != null) {
        setState(() {
          matchedItems[leftItem!] = rightItem!;
        });
      }
    }
  }

  String? _getIntersectedItem(List<GlobalKey> keys, List<String> items, Offset point) {
    for (int i = 0; i < keys.length; i++) {
      RenderBox? box = keys[i].currentContext?.findRenderObject() as RenderBox?;
      if (box != null) {
        Offset position = box.localToGlobal(Offset.zero);
        Size size = box.size;
        Rect rect = position & size;
        if (rect.contains(point)) {
          return items[i];
        }
      }
    }
    return null;
  }
}

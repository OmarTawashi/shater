import 'package:flutter/material.dart';
import 'package:flutter_quiz_matcher/flutter_quiz_matcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
    return Column(
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
        )
      ],
    );
  }
}

class MyWidget extends StatelessWidget {
  final QuestionController? controller;
  const MyWidget({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: QuizMatcher(
        questions: List.generate(
            4,
            (index) => Container(
                height: 80,
                width: 141,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(width: 2.5, color: COLORS.primaryColor),
                ),
                child: CachedNetworkImageWidget(
                  imageUrl: '   ',
                  height: 78,
                  width: 141,
                ))),
        answers: List.generate(
            4,
            (index) => Container(
                  height: 80,
                  width: 141,
                  padding: EdgeInsets.symmetric(horizontal: 26, vertical: 27),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(width: 2.5, color: COLORS.primaryColor),
                  ),
                  child: CustomText(
                    text: 'text',
                    fontSize: Dimensions.fontSize15,
                    color: Color.fromRGBO(96, 96, 96, 1),
                    maxLine: 1,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold,
                  ),
                )),
        onScoreUpdated: (userAnswers) {
          print(userAnswers.questionIndex);
          print(userAnswers.questionAnswer);
        },
        defaultLineColor: Colors.black,
        correctLineColor: Colors.green,
        incorrectLineColor: Colors.red,
        drawingLineColor: Colors.amber,
        paddingAround: EdgeInsets.all(0),
      ),
    );
  }
}

class MatcherQuizScreen extends StatefulWidget {
  @override
  _MatcherQuizScreenState createState() => _MatcherQuizScreenState();
}

class _MatcherQuizScreenState extends State<MatcherQuizScreen> {
  List<String> items1 = ['A', 'B', 'C'];
  List<String> items2 = ['1', '2', '3'];
  Map<String, String> matching = {};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: items1.map((item) {
                    return Draggable<String>(
                      data: item,
                      child: _buildItem(item),
                      feedback: _buildItem(item, isFeedback: true),
                      childWhenDragging: _buildItem(item),
                    );
                  }).toList(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: items2.map((item) {
                    return DragTarget<String>(
                      builder: (BuildContext context, List<String?> candidateData,
                          List<dynamic> rejectedData) {
                        return Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey,
                          child: Center(
                            child: Text(matching.containsValue(item)
                                ? matching.keys
                                    .firstWhere((key) => matching[key] == item)
                                : ''),
                          ),
                        );
                      },
                      onWillAccept: (data) => true,
                      onAccept: (data) {
                        setState(() {
                          matching[data!] = item;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                matching.clear();
              });
            },
            child: Text('Reset'),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String item, {bool isFeedback = false}) {
    return Container(
      width: 100,
      height: 100,
      color: isFeedback ? Colors.blue.withOpacity(0.5) : Colors.blue,
      child: Center(
        child: Text(
          item,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

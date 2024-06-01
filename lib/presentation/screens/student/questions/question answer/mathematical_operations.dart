// import 'package:flutter/material.dart';
// import 'package:shater/core/extenstion/question_extention.dart';
// import 'package:shater/presentation/screens/student/questions/question%20answer/arithmetic_text.dart';
// import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
// import 'package:shater/util/dimensions.dart';

// class MathematicalOperations extends StatelessWidget {
//   final QuestionController controller;
//   const MathematicalOperations({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     controller.getObjetArithmitic();
//     int indexPrimary = 0;
//     final questionContent = controller.arithmeticTextModel?.questionContent;

//     if (questionContent != null && questionContent.isNotEmpty) {
//       for (int i = 0; i < questionContent.length; i++) {
//         final element = questionContent[i];
//         if (indexPrimary < questionContent.length) {
//           List ans = [];
//           controller.arithmeticTextModel?.questionContent?[indexPrimary]
//               .forEach((element) {
//             ans.add(element.fieldType);
//           });
//           return Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: Dimensions.paddingSize16),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Wrap(
//                   runSpacing: Dimensions.paddingSize12,
//                   alignment: WrapAlignment.start,
//                   spacing: Dimensions.paddingSize10,
//                   children: List.generate(
//                       controller.arithmeticTextModel
//                               ?.questionContent?[indexPrimary].length ??
//                           0, (indexParent) {
//                     final questionContent = controller
//                         .arithmeticTextModel?.questionContent?[indexParent];
//                     final answer = ans[indexParent];
//                     return answer.toString().getQuestionArithmicitcTextWidget(
//                           numberWithFraction: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: List.generate(
//                                   questionContent?[indexParent]
//                                           .subFields
//                                           ?.length ??
//                                       0,
//                                   (index) => Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       getSwitchInputText(
//                                         questionContent?[indexParent]
//                                             .subFields?[index]
//                                             .isAnswer,
//                                         inputField: InputAnswerOperater(
//                                           row: 1,
//                                         ),
//                                         stable: ItemStableText(
//                                           text: questionContent?[indexParent]
//                                                   .subFields?[index]
//                                                   .title ??
//                                               '0',
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 2,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 3,
//                               ),
//                               getSwitchInputText(
//                                   questionContent?[indexParent].isAnswer,
//                                   inputField: InputAnswerOperater(
//                                     row: 2,
//                                   ),
//                                   stable: ItemStableText(
//                                     text: questionContent?[indexParent].title,
//                                     row: 2,
//                                   )),
//                             ],
//                           ),
//                           fraction: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: List.generate(
//                               questionContent?[indexParent].subFields?.length ??
//                                   0,
//                               (index) => Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   getSwitchInputText(
//                                     questionContent?[indexParent]
//                                         .subFields?[index]
//                                         .isAnswer,
//                                     inputField: InputAnswerOperater(
//                                       row: 1,
//                                     ),
//                                     stable: ItemStableText(
//                                       text: questionContent?[indexParent]
//                                               .subFields?[index]
//                                               .title ??
//                                           '0',
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 2,
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           other: TypeOperatorText(
//                             text: questionContent?[indexParent].title,
//                           ),
//                           stable: SizedBox(
//                             width: 1,
//                           ),
//                         );
//                   }),
//                 ),
//               ],
//             ),
//           );
//         }
//         indexPrimary++;
//       }
//     }
//     return SizedBox();
//   }
// }

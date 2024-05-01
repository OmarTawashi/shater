import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class ResultSubjectScreen extends StatelessWidget {
  const ResultSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ButtonBack(),
        centerTitle: true,
        title: CustomText(
          text: 'lpl] sfhl,',
          color: Colors.white,
          fontSize: Dimensions.fontSize24,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            child: Image.asset(
              IMAGES.firstImages,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/util/color.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
      ),
      body: Column(
        children: [
          Container(
            width: Get.width,
            decoration: const BoxDecoration(color: COLORS.primaryColor),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/routes/app_routes.dart';

import '../../../util/color.dart';

class ButtonSettings extends StatelessWidget {
  ButtonSettings({
    super.key,
    required this.onTap,
  });

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: COLORS.backGroundColor,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.settings,
            size: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

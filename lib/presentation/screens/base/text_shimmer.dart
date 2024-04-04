import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class shimmerText extends StatelessWidget {
  final double width;
  const shimmerText({
    super.key,
    this.width = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: width.w,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
    );
  }
}
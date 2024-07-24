import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../util/color.dart';
import '../../../../base/text_custom.dart';

class QualificationsTab extends StatelessWidget {
  const QualificationsTab({
    super.key,
    required this.title,
    required this.id,
    required this.selectedTabId,
    required this.onSelect,
  });

  final String title;
  final int id;
  final int selectedTabId;
  final Function onSelect;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onSelect();
        },
        child: Container(
          height: 40.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected() ? COLORS.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: CustomText(
            text: title,
            fontWeight: FontWeight.bold,
            color: !isSelected() ? COLORS.primaryColor : Colors.white,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }

  bool isSelected() {
    return selectedTabId == id;
  }
}
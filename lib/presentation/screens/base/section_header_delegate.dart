import 'package:flutter/material.dart';

import '../../../util/color.dart';

class SectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget? widget;
  final double height;

  SectionHeaderDelegate({this.height = 50, this.widget});

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: height,
      color: COLORS.primaryColor,
      child: widget,
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

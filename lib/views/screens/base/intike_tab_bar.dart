import 'package:flutter/material.dart';

import '../../../util/color.dart';
import 'section_header_delegate.dart';

class IntikeTapBar extends StatelessWidget {
  final Widget? child;
  const IntikeTapBar({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SectionHeaderDelegate(
        height: 90,
        widget: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                border: Border.all(color: COLORS.secanderyColor, width: 2.5)),
            child: child),
      ),
    );
  }
}

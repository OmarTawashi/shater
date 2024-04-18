import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';

import '../../../util/color.dart';
import 'section_header_delegate.dart';

class IntikeTapBar extends StatelessWidget {
  final Widget? child;
  final Widget? secanderyChild;
  final String assetName;

  const IntikeTapBar(
      {super.key, required this.assetName, this.secanderyChild, this.child});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SectionHeaderDelegate(
        height: 160,
        widget: Column(
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: COLORS.backGroundColor,borderRadius:BorderRadius.circular(15)),
                child: CustomSvgPicture(
                  assetName: assetName,
                  height: 40,
                  width: 40,
                )),
            child == null
                ? const SizedBox()
                : Container(
                    margin: const EdgeInsets.fromLTRB(16, 15, 16, 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(
                            color: COLORS.secanderyColor, width: 2.5)),
                    child: child),
            secanderyChild ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}

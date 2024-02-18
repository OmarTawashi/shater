import 'package:flutter/material.dart';
import 'package:shater/util/color.dart';

class CustomSliverAppBar extends StatelessWidget {
  final List<Widget>? actions;
  final bool floating;
  final bool primary;
  final bool pinned;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final double elevation;
  final Color backgroundColor;
  final bool automaticallyImplyLeading;
  final double? leadingWidth;
  const CustomSliverAppBar(
      {super.key,
      this.leading,
      this.title,
      this.actions,
      this.leadingWidth,
      this.automaticallyImplyLeading = false,
      this.elevation = 0,
      this.floating = false,
      this.primary = false,
      this.pinned = false,
      this.centerTitle,
      this.backgroundColor = COLORS.primaryColor});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leadingWidth: leadingWidth,
      toolbarHeight: 60,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
      floating: floating,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      leading: leading,
      title: title,
      elevation: elevation,
      primary: primary,
      pinned: pinned,
    );
  }
}

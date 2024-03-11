import 'package:flutter/material.dart';

class CustomShimmerList extends StatelessWidget {
  final Widget? itemShimmer;
  const CustomShimmerList({super.key, this.itemShimmer});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 8,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => itemShimmer,
    );
  }
}

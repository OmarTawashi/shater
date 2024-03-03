import 'package:flutter/material.dart';

class CustomShimmerList extends StatelessWidget {
  final Widget? itemShimmer;
  const CustomShimmerList({super.key, this.itemShimmer});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => itemShimmer,
    );
  }
}

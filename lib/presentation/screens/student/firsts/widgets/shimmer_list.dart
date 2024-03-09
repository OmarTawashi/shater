import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/custom_shimmer_list.dart';
import 'package:shater/presentation/screens/student/firsts/widgets/shimmer_first_student.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerList(
      itemShimmer: ShimmerFirstStudent(),
    );
  }
}

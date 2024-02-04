import 'package:flutter/material.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/views/screens/base/intike_tab_bar.dart';

import '../../../../util/images.dart';
import '../../base/perfect_app_bar.dart';
import '../../base/text_custom.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const PerfectAppBar(
            assetName: ICONS.subscriptionTop,
          ),
          IntikeTapBar(
            child: Row(
              children: [
                SizedBox(
                  width: Dimensions.paddingSize16,
                ),
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 18,
                ),
                Expanded(
                  child: CustomText(
                    text: 'subscription',
                    textAlign: TextAlign.center,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

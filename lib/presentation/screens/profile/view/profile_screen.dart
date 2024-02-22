import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/section_header_delegate.dart';
import 'package:shater/presentation/screens/profile/widgets/intike_profile_imoji.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: COLORS.primaryColor,
            leading: ButtonBack(),
            pinned: true,
          ),
          SliverPersistentHeader(
              pinned: true,
              delegate: SectionHeaderDelegate(
                  height: 85,
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IntikeProfileImoji(
                        asset: IMAGES.firstImages,
                        text: 'mohamed',
                        isEnable: true,
                      ),
                      IntikeProfileImoji(
                        asset: IMAGES.firstImages,
                        text: 'mohamed',
                      ),
                      IntikeProfileImoji(
                        asset: IMAGES.add,
                        text: 'add Student',
                      ),
                    ],
                  )))
        ],
      ),
    );
  }
}

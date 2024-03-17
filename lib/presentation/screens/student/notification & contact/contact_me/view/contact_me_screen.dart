import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/tap_section.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/constant.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';
import 'package:shater/util/images.dart';

import '../../../../base/intike_tab_bar.dart';

class ContactMeScreen extends StatelessWidget {
  const ContactMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
        leading: ButtonBack(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(72, 131, 196, 1),
                      borderRadius: BorderRadius.circular(13)),
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.white,
                    size: 20,
                    weight: 5,
                  ),
                ),
                SizedBox(
                  width: Dimensions.paddingSize5,
                ),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.white,
                    style: FontStyleConstant.hNLTRegular.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontSize15,
                        locale: Locale(APPCONSTANT.languages[1].languageCode ?? '',
                            APPCONSTANT.languages[0].languageCode)),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return;
                      }
                  
                      return null;
                    },
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                    
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(72, 131, 196, 1), width: 2)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: 'write_me',
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(72, 131, 196, 1), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(72, 131, 196, 1), width: 2)),
                      hintStyle: FontStyleConstant.hNLTRegular.copyWith(
                        color: Color.fromRGBO(72, 131, 196, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontSize15,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(72, 131, 196, 1), width: 2)),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          IntikeTapBar(
            assetName: ICONS.contactTop,
            child: Row(
              children: [
                TapSection(
                  isSelected: true,
                  text: 'app_shater'.tr,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

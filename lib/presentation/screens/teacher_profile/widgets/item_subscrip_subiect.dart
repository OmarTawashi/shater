import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class ItemSubscribSubject extends StatelessWidget {
  const ItemSubscribSubject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 19),
      decoration: BoxDecoration(
          gradient: COLORS.gradientContainer,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 70,
            width: 70,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 4.5),
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImageWidget(
              imageUrl: '',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: Dimensions.paddingSize12,
          ),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'subscription_date',
                      color: Colors.white,
                      fontSize: Dimensions.fontSize15,
                      fontWeight: FontWeight.w300,
                    ),
                    CustomText(
                      text: "23/3/2024",
                      color: Colors.white,
                      fontSize: Dimensions.fontSize15,
                      fontWeight: FontWeight.w300,
                    ),
                  ],
                ),
                const SizedBox(
                  height: Dimensions.paddingSize20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'expires_in',
                      color: Colors.white,
                      fontSize: Dimensions.fontSize15,
                      fontWeight: FontWeight.w300,
                    ),
                    CustomText(
                      text: "23/3/2024",
                      color: Colors.white,
                      fontSize: Dimensions.fontSize15,
                      fontWeight: FontWeight.w300,
                    ),
                  ],
                ),
              ])),
          SizedBox(
            width: Dimensions.paddingSize16,
          ),
          Icon(
            Icons.arrow_forward_ios_sharp,
            color: Colors.white,
            weight: 20,
            applyTextScaling: true,
          )
        ],
      ),
    );
  }
}

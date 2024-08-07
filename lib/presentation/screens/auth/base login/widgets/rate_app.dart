import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../util/images.dart';
import '../../../base/svgpicture_custom.dart';

class RateApp extends StatelessWidget {
  final double? initRate;
  final double? itemSize;
  const RateApp({
    super.key,
    this.initRate,
    this.itemSize,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: initRate ?? 0,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: itemSize ?? 27,
      unratedColor: const Color.fromRGBO(0, 208, 254, 1),
      itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      ratingWidget: RatingWidget(
          full: const CustomSvgPicture(assetName: ICONS.starRatingFull),
          half: const CustomSvgPicture(assetName: ICONS.starRatingFull),
          empty: const CustomSvgPicture(assetName: ICONS.starRating)),
      onRatingUpdate: (rating) {},
    );
  }
}

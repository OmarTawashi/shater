// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../util/assets_manager.dart';

class CustomNetworkImage extends StatelessWidget {
  CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);

  var imageUrl;
  double? height;
  double? width;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return (imageUrl == null || imageUrl == '' || imageUrl == false)
        ? Image.asset(AppMedia.default_user_image, fit: BoxFit.cover)
        : CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            width: height,
            height: width,
            color: color ?? Colors.transparent,
            // httpHeaders: ConstanceNetwork.header(TypeToken.Authorization),
            placeholder: (context, url) {
              return SizedBox(
                width: height ?? double.infinity,
                height: width ?? double.infinity,
                child: Image.asset(AppMedia.loadingShimmer, fit: BoxFit.cover),
              );
            },
            errorWidget: (context, url, error) {
              return Image.asset(AppMedia.default_user_image,
                  fit: BoxFit.cover);
            },
          );
  }
}

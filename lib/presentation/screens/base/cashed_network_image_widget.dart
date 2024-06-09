import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shater/util/images.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  const CachedNetworkImageWidget({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => Image.asset(
        IMAGES.loadingGif,
        width: 90,
        height: 90,
        fit: BoxFit.cover,
      ),
      errorWidget: (context, url, error) => Container(
        width: 50,
        height: 50,
        child: Center(
          child: Image.asset(
            IMAGES.logoLuncher,
            width: 55,
            height: 55,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

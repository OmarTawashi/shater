import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';

class ImageUser extends StatelessWidget {
  final String? imageUrl;
  const ImageUser({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          border: imageUrl == null || imageUrl == ''
              ? Border.all(
                  color: Colors.white,
                )
              : null,
          shape: BoxShape.circle),
      child: CachedNetworkImageWidget(
        imageUrl: imageUrl ?? '',
        fit: BoxFit.cover,
      ),
    );
  }
}

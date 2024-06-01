import 'package:flutter/material.dart';

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (renderObject is RenderBox && translation != null) {
      return renderObject.paintBounds
          .shift(Offset(translation.x, translation.y));
    }
    return null;
  }
}

import 'package:flutter/material.dart';

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (renderObject is RenderBox && translation != null) {
      return renderObject.paintBounds.shift(Offset(translation.x, translation.y));
    }
    return null;
  }
}

extension ArabicToEnglishExtension on String {
  String arabicToEnglish() {
    const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    const englishDigits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

    String convertedText = '';

    for (int i = 0; i < this.length; i++) {
      final index = arabicDigits.indexOf(this[i]);
      convertedText += index != -1 ? englishDigits[index] : this[i];
    }

    return convertedText;
  }
}

import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class ImageConverter {
  static String convertImageFileToBase64(File imageFile) {
    List<int> imageBytes = imageFile.readAsBytesSync();
    String image = base64Encode(imageBytes);
    return image;
  }

  static Uint8List convertBase64ToImageBytes(String base64Image) {
    Uint8List imageBytes = base64Decode(base64Image);
    return imageBytes;
  }

  static Future<Uint8List> convertFileToBytes(String filePath) async {
    File file = File(filePath);
    Uint8List fileBytes = await file.readAsBytes();
    return fileBytes;
  }

  static Future<Uint8List?> convertUiImageToBytes(ui.Image image) async {
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData?.buffer.asUint8List();
  }

  static Future<File> writeBytesToFile(Uint8List bytes, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    return file.writeAsBytes(bytes);
  }

  static Future<Uint8List?> convertImageToBytes(ui.Image image) async {
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List? bytes;

    if (byteData != null) {
      bytes = byteData!.buffer.asUint8List();
    } else {
      bytes = null;
    }
    return bytes;
  }

  static Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);
    final buffer = byteData.buffer;
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    final file = await File('$tempPath/${path.split('/').last}').writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file;
  }
}

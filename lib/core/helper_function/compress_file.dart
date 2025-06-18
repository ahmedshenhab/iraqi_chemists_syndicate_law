import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<File> compressFile(File file) async {
  final ext = file.path.split('.').last.toLowerCase();

  if (ext == 'jpg' || ext == 'jpeg') {
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      '${file.path}_compressed.jpg',
      quality: 65,
    );

    return File(result!.path);
  } else if (ext == 'png') {
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      '${file.path}_compressed.jpg',

      quality: 65,
    );

    return File(result!.path);
  } else {
    return file;
  }
}

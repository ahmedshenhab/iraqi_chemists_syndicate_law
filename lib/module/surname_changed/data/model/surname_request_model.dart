import 'dart:io';
import 'package:dio/dio.dart';

class SurnameChangedModel {

  SurnameChangedModel({
    required this.experienseCertificateImage,
    required this.enrollNumberId,
    required this.enrollExpireDate,
    required this.currentTittle,
    required this.pormotionTittle,
  });
  final File experienseCertificateImage;
  final String enrollNumberId;
  final String enrollExpireDate;
  final String currentTittle;
  final String pormotionTittle;

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'ExperienseCertificateImage': await MultipartFile.fromFile(
        experienseCertificateImage.path,
        filename: experienseCertificateImage.path.split('/').last,
      ),
      'EnrollNumberId': enrollNumberId,
      'EnrollExpireDate': enrollExpireDate,
      'CurrentTittle': currentTittle,
      'PormotionTittle': pormotionTittle,
    });
  }
}

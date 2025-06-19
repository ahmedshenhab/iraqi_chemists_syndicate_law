import 'dart:io';
import 'package:dio/dio.dart';

class RenewRequestModel {
  RenewRequestModel({
    required this.identityCard,
    required this.enrollNumberId,
    required this.enrollExpireDate,
  });

  final File identityCard;
  final String enrollNumberId;
  final String enrollExpireDate;

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'IdentityCard': await MultipartFile.fromFile(
        identityCard.path,
        filename: identityCard.path.split('/').last,
      ),
      'EnrollNumberId': enrollNumberId,
      'EnrollExpireDate': enrollExpireDate,
    });
  }
}

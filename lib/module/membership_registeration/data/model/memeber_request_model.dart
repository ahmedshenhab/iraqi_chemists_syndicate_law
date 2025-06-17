import 'dart:io';
import 'package:dio/dio.dart';

class MemeberRequestModel {
  MemeberRequestModel(
   {required this.userId,
    required this.status,
    required this.memberNameArabic,
    required this.memberNameEnglish,
    required this.memberEmail,
    required this.memberPhoneNumber,
    required this.memberImage,
    required this.memberGovernerate,
    required this.memberCity,
    required this.memberStreet,
    required this.memberVillage,
    required this.memberBuildingId,
    required this.memberIsEmployee,
    required this.memberPHDCertificate,
    required this.memberBSCCertificate,
    required this.memberMasterCertificate,
  });
  final String memberNameArabic;
  final String memberNameEnglish;
  final String memberEmail;
  final String memberPhoneNumber;
  final File memberImage;
  final String memberGovernerate;
  final String memberCity;
  final String memberStreet;
  final String memberVillage;
  final String memberBuildingId;
  final String memberIsEmployee;
  final File memberPHDCertificate;
  final File memberBSCCertificate;
  final File memberMasterCertificate;
  final String userId;
  final String status;

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'MemberNameArabic': memberNameArabic,
      'MemberNameEnglish': memberNameEnglish,
      'MemberEmail': memberEmail,
      'MemberPhoneNumber': memberPhoneNumber,
      'MemberImage': await MultipartFile.fromFile(
        memberImage.path,
        filename: memberImage.path.split('/').last,
      ),
      'MemberGovernerate': memberGovernerate,
      'MemberCity': memberCity,
      'MemberStreet': memberStreet,
      'MemberVillage': memberVillage,
      'MemberBuildingId': memberBuildingId,
      'MemberIsEmployee': memberIsEmployee,
      'MemberPHDCertificate': await MultipartFile.fromFile(
        memberPHDCertificate.path,
        filename: memberPHDCertificate.path.split('/').last,
      ),
      'MemberBSCCertificate': await MultipartFile.fromFile(
        memberBSCCertificate.path,
        filename: memberBSCCertificate.path.split('/').last,
      ),
      'MemberMasterCertificate': await MultipartFile.fromFile(
        memberMasterCertificate.path,
        filename: memberMasterCertificate.path.split('/').last,
      ),
      'UserId': userId,
      'Status': status,
    });
  }
}

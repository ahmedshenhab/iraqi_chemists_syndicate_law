import 'dart:io';
import 'package:dio/dio.dart';

class MemeberRequestModel {
  MemeberRequestModel({
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
    required this.buildingLicence,
    required this.nationalIdImage,
    required this.scientificDegree,
    required this.universityName,
    required this.collegName,
    required this.graduationYear,
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
  final File buildingLicence;
  final File nationalIdImage;

  final String scientificDegree;
  final String universityName;
  final String collegName;
  final String graduationYear;

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

      'BuildingLicence': await MultipartFile.fromFile(
        buildingLicence.path,
        filename: buildingLicence.path.split('/').last,
      ),
      'NationalIdImage': await MultipartFile.fromFile(
        nationalIdImage.path,
        filename: nationalIdImage.path.split('/').last,
      ),
      'scientificDegree': scientificDegree,
      'UniversityName': universityName,
      'CollegName': collegName,
      'GraduationYear': graduationYear,
    });
  }
}

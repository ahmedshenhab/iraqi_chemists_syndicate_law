import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iraqi_chemists_syndicate_law/core/helper_function/compress_file.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_endpoint.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_state.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/data/model/memeber_request_model.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/data/repo/repo.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class MembershipRegisterationCubit extends Cubit<MembershipRegisterationState> {
  MembershipRegisterationCubit(
    MembershipRegisterationRepo membershipRegisterationRepo,
  ) : _membershipRegisterationRepo = membershipRegisterationRepo,
      super(MembershipRegisterationCubitInitial()) {
    pageController = PageController();
  }
  //privatrepo

  final MembershipRegisterationRepo _membershipRegisterationRepo;

  Future<void> createMember() async {
    final createMemberRequestModel = MemeberRequestModel(
      status: 'painding',
      userId: '${JwtDecoder.decode(ApiEndpoint.token)[ApiEndpoint.userId]}',

      memberNameArabic: arabicFullNameController.text,
      memberNameEnglish: englishFullNameController.text,
      memberEmail: emailController.text,
      memberPhoneNumber: phoneController.text,
      memberImage: personalImage!,
      memberGovernerate: memberGovernerate!,
      memberCity: memberCity!,
      memberStreet: memberStreet!,
      memberVillage: zokakController.text,
      memberBuildingId: homeController.text,
      memberIsEmployee: '$isEmployee',
      memberPHDCertificate: attachmentFiles['doctor_certificate']!,
      memberBSCCertificate: attachmentFiles['graduation_certificate']!,
      memberMasterCertificate: attachmentFiles['master_certificate']!,
    );

    emit(MembershipRegisterationLoading());
    final result = await _membershipRegisterationRepo.createMember(
      memeberRequestModel: createMemberRequestModel,
    );

    result.fold(
      (l) => emit(MembershipRegisterationError(l.message ?? "")),
      (r) => emit(MembershipRegisterationSuccess(r)),
    );
  }

  void pickImage() async {
    final XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (image != null && image.path.isNotEmpty) {
      final File original = File(image.path);
      final File compressed = await compressFile(original); // ⬅️ compression
      personalImage = compressed;
    } else {
      personalImage = null;
    }

    emit(BasicInformationImages());
  }

  void pickFile(String attachmentKey) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg'],
    );

    if (result != null && result.files.isNotEmpty) {
      final original = File(result.files.first.path!);
      attachmentFiles[attachmentKey] = await compressFile(original);
    } else {
      attachmentFiles[attachmentKey] = null;
    }

    emit(AttachmentFileUpdated(attachmentKey));
  }

  Future<void> nextPage() async {
    await pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  Future<void> previousPage() async {
    await pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  bool get isRequredAttachmentsHere {
    for (var attachment in attachments) {
      final key = attachment['key'] as String;
      final isOptional = attachment['isVisibleOptional'] as bool;

      if (!isOptional && (attachmentFiles[key] == null)) {
        return false;
      }
    }
    return true;
  }

  Map<String, File?> attachmentFiles = {
    'image_identity_card': null,
    'image_homming_card': null,
    'graduation_certificate': null,
    'master_certificate': null,
    'doctor_certificate': null,
  };

  final List<Map<String, dynamic>> attachments = [
    {
      'key': 'image_identity_card',
      'title': 'تحميل صورة بطاقة الهوية',
      'isVisibleOptional': false,
    },
    {
      'key': 'image_homming_card',
      'title': 'تحميل صورة بطاقة السكن',
      'isVisibleOptional': false,
    },
    {
      'key': 'graduation_certificate',
      'title': 'تحميل صورة وثيقة التخرج',
      'isVisibleOptional': false,
    },
    {
      'key': 'master_certificate',
      'title': 'تحميل صورة شهادة الماجستير',
      'isVisibleOptional': false,
    },
    {
      'key': 'doctor_certificate',
      'title': 'تحميل صورة شهادة الدكتوراة',
      'isVisibleOptional': false,
    },
  ];

  final formKeyBasicInformation = GlobalKey<FormState>();
  final formKeyGraduation = GlobalKey<FormState>();
  final formKeyHomming = GlobalKey<FormState>();

  File? personalImage;

  late PageController pageController;
  static MembershipRegisterationCubit get(context) => BlocProvider.of(context);

  final TextEditingController arabicFullNameController =
      TextEditingController();
  final TextEditingController englishFullNameController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? memberGovernerate;
  String? memberCity;
  String? memberStreet;
  final zokakController = TextEditingController();
  final homeController = TextEditingController();
  bool? isEmployee;
  bool? isAgreeToTerms = false;
  bool? isPledgedInfoAccuracy = false;

  @override
  Future<void> close() {
    pageController.dispose();
    arabicFullNameController.dispose();
    englishFullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    zokakController.dispose();
    homeController.dispose();

    return super.close();
  }
}

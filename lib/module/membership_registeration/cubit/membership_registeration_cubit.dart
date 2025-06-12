import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit_state.dart';

class MembershipRegisterationCubit
    extends Cubit<MembershipRegisterationCubitState> {
  MembershipRegisterationCubit()
    : super(MembershipRegisterationCubitInitial()) {
    pageController = PageController(initialPage: 4);
  }
  
  void pickFile(String attachmentKey) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg'],
    );

    if (result != null && result.files.isNotEmpty) {
      attachmentFiles[attachmentKey] = File(result.files.first.path!);
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
      'isVisibleOptional': true,
    },
    {
      'key': 'doctor_certificate',
      'title': 'تحميل صورة شهادة الدكتوراة',
      'isVisibleOptional': true,
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

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit_state.dart';

class MembershipRegisterationCubit
    extends Cubit<MembershipRegisterationCubitState> {
  MembershipRegisterationCubit()
    : super(MembershipRegisterationCubitInitial()) {
    pageController = PageController();
  }

  final picker = ImagePicker();

  bool? isEmployee = false;
  File? personalImage;

  late PageController pageController;
  static MembershipRegisterationCubit get(context) => BlocProvider.of(context);

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

  final TextEditingController arabicFullNameController =
      TextEditingController();
  final TextEditingController englishFullNameController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Future<void> close() {
    pageController.dispose();
    arabicFullNameController.dispose();
    englishFullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    return super.close();
  }
}

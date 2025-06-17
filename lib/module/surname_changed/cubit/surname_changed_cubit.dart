import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import 'package:iraqi_chemists_syndicate_law/module/surname_changed/data/repo/repo.dart';

part 'surname_changed_state.dart';

class SurnameChangedCubit extends Cubit<SurnameChangedState> {
  SurnameChangedCubit(SurnameRepo repo,)
    : _repo = repo,
      super(SurnameChangedInitial());
  static SurnameChangedCubit get(context) => BlocProvider.of(context);
  final SurnameRepo _repo;

  final registrationDateController = TextEditingController(),
      registrationNumberController = TextEditingController();
  String? currenttitle, newtittle;

  final formKey = GlobalKey<FormState>();

  File? experienseCertificateImage;

  Future<void> changeSurname() async {
    if (formKey.currentState!.validate()) {
      emit(SurnameChangedLoading());
      final response = await _repo.changeSurname(
        enrollNumberId: registrationNumberController.text,
        enrollExpireDate: registrationDateController.text,
        currentTittle: currenttitle!,
        pormotionTittle: newtittle!,
        filePath: experienseCertificateImage!.path,
        fileName: experienseCertificateImage!.path.split('/').last,
      );
      response.fold((error) => emit(SurnameChangedError(error.message ?? "")), (
        message,
      ) {
        emit(SurnameChangedSuccess(message));
      });
    }
  }

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null && result.files.isNotEmpty) {
      experienseCertificateImage = File(result.files.first.path!);
    } else {
      experienseCertificateImage = null;
    }

    emit(SurnameChangeimage());
  }

  @override
  Future<void> close() {
    registrationDateController.dispose();
    registrationNumberController.dispose();
    return super.close();
  }
}

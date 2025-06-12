import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

part 'surname_changed_state.dart';

class SurnameChangedCubit extends Cubit<SurnameChangedState> {
  SurnameChangedCubit() : super(SurnameChangedInitial());
  static SurnameChangedCubit get(context) => BlocProvider.of(context);

  final TextEditingController registrationDateController =
      TextEditingController();
  final TextEditingController registrationNumberController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  File? magesteerimage;
  File? graduationimage;
  File? doctorsimage;
  Future<void> pickFile(int fileIndex) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null && result.files.isNotEmpty) {
      if (fileIndex == 0) {
        magesteerimage = File(result.files.first.path!);
      } else if (fileIndex == 1) {
        graduationimage = File(result.files.first.path!);
      } else if (fileIndex == 2) {
        doctorsimage = File(result.files.first.path!);
      }
    } else {
      if (fileIndex == 0) {
        magesteerimage = null;
      } else if (fileIndex == 1) {
        graduationimage = null;
      } else if (fileIndex == 2) {
        doctorsimage = null;
      }
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

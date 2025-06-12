import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

part 'renew_member_state.dart';

class RenewMemberCubit extends Cubit<RenewMemberState> {
  RenewMemberCubit() : super(RenewMemberChangedInitial());
  static RenewMemberCubit get(context) => BlocProvider.of(context);

  final TextEditingController registrationDateController =
      TextEditingController();
  final TextEditingController registrationNumberController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  File? magesteerimage;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    magesteerimage = result != null && result.files.isNotEmpty
        ? File(result.files.first.path!)
        : null;

    emit(RenewMemberChangeimage());
  }

  @override
  Future<void> close() {
    registrationDateController.dispose();
    registrationNumberController.dispose();
    return super.close();
  }
}

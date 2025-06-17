import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import 'package:iraqi_chemists_syndicate_law/module/renew_member/data/repo/repo.dart';

part 'renew_member_state.dart';

class RenewMemberCubit extends Cubit<RenewMemberState> {
  RenewMemberCubit(RenewMemberRepo repo)
    : _repo = repo,
      super(RenewMemberChangedInitial());
  static RenewMemberCubit get(context) => BlocProvider.of(context);
  final RenewMemberRepo _repo;

  Future<void> renewMember() async {
    emit(RenewMemberLoading());

    final response = await _repo.renewMember(
      enrollNumberId: registrationDateController.text,
      enrollExpireDate: registrationNumberController.text,
      filePath: identityCardImage!.path,
      fileName: identityCardImage!.path.split('/').last,
    );
    response.fold((error) => emit(RenewMemberError(error.message ?? "")), (
      message,
    ) {
      emit(RenewMemberSuccess(message));
    });
  }

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    identityCardImage = result != null && result.files.isNotEmpty
        ? File(result.files.first.path!)
        : null;

    emit(RenewMemberChangeimage());
  }

  final TextEditingController registrationDateController =
      TextEditingController();
  final TextEditingController registrationNumberController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  File? identityCardImage;

  @override
  Future<void> close() {
    registrationDateController.dispose();
    registrationNumberController.dispose();
    return super.close();
  }
}

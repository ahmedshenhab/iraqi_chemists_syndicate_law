import 'package:flutter/material.dart';

@immutable
sealed class MembershipRegisterationState {}

final class MembershipRegisterationCubitInitial
    extends MembershipRegisterationState {}

final class AttachmentFileUpdated extends MembershipRegisterationState {
  AttachmentFileUpdated(this.attachmentKey);

  final String attachmentKey;
}

final class BasicInformationImages extends MembershipRegisterationState {}

final class MembershipRegisterationLoading extends MembershipRegisterationState {}

final class MembershipRegisterationSuccess extends MembershipRegisterationState {
  MembershipRegisterationSuccess(this.message);

  final String message;
}

final class MembershipRegisterationError extends MembershipRegisterationState {
  MembershipRegisterationError(this.message);

  final String message;
}

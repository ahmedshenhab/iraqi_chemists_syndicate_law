import 'package:flutter/material.dart';

@immutable
sealed class MembershipRegisterationCubitState {}

final class MembershipRegisterationCubitInitial extends MembershipRegisterationCubitState {}

final class AttachmentFileUpdated extends MembershipRegisterationCubitState {
  AttachmentFileUpdated(this.attachmentKey);
  
 
  final String attachmentKey;
}
part of 'renew_member_cubit.dart';

@immutable
abstract class RenewMemberState {}

class RenewMemberChangedInitial extends RenewMemberState {}

class RenewMemberChangeimage extends RenewMemberState {}

class RenewMemberLoading extends RenewMemberState {}

class RenewMemberSuccess extends RenewMemberState {
  RenewMemberSuccess(this.message);
  final String message;
}

class RenewMemberError extends RenewMemberState {
  RenewMemberError(this.message);
  final String message;
}

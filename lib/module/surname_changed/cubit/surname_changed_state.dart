part of 'surname_changed_cubit.dart';

@immutable
abstract class SurnameChangedState {}

class SurnameChangedInitial extends SurnameChangedState {}

class SurnameChangeimage extends SurnameChangedState {}

class SurnameChangedLoading extends SurnameChangedState {}

class SurnameChangedSuccess extends SurnameChangedState {
  SurnameChangedSuccess(this.message);
  final String message;
}

class SurnameChangedError extends SurnameChangedState {
  SurnameChangedError(this.error);
  final String error;
}

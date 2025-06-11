import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'surname_changed_state.dart';

class SurnameChangedCubit extends Cubit<SurnameChangedState> {
  SurnameChangedCubit() : super(SurnameChangedInitial());
  static SurnameChangedCubit get(context) => BlocProvider.of(context);
final TextEditingController surnameController = TextEditingController();

final TextEditingController registrationDateController = TextEditingController();
@override
  Future<void> close() {
    surnameController.dispose();
    return super.close();
}

}

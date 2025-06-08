import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit_state.dart';

class MembershipRegisterationCubit
    extends Cubit<MembershipRegisterationCubitState> {
  MembershipRegisterationCubit()
    : super(MembershipRegisterationCubitInitial()) {
    pageController = PageController();
  }

  bool? groupValue;

  late PageController pageController;
  static MembershipRegisterationCubit get(context) => BlocProvider.of(context);
  //   duration: Duration(milliseconds: 300),
  // curve: Curves.easeInOut,
  Future<void> nextmove() async {
    await pageController.nextPage(
      duration: const Duration(seconds: 3),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}

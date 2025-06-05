import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqi_chemists_syndicate_law/membership_registeration/cubit/membership_registeration_cubit_state.dart';

class MembershipRegisterationCubit
    extends Cubit<MembershipRegisterationCubitState> {
  MembershipRegisterationCubit()
    : super(MembershipRegisterationCubitInitial()) {
    pageController = PageController(initialPage: 1);
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

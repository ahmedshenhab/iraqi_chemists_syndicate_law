import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'membership_registeration_cubit_state.dart';

class MembershipRegisterationCubit
    extends Cubit<MembershipRegisterationCubitState> {
  MembershipRegisterationCubit()
    : super(MembershipRegisterationCubitInitial()) {
    pageController = PageController(initialPage: 4);

  }


   bool? groupValue ;

  late PageController pageController;
  static MembershipRegisterationCubit get(context) => BlocProvider.of(context);
  //   duration: Duration(milliseconds: 300),
  // curve: Curves.easeInOut,
   Future<void> nextmove()async {
      await pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }
  

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}

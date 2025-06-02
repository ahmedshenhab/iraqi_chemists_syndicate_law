import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqi_chemists_syndicate_law/auth/login/login_screen.dart';
import 'package:iraqi_chemists_syndicate_law/membership_registeration/cubit/membership_registeration_cubit_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/membership_registeration/membership_registeration_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      // login
      case LoginScreen.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case MembershipRegisterationScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => MembershipRegisterationCubit(),
            child: const MembershipRegisterationScreen(),
          ),
        );

      default:
        return null;
    }
  }
}

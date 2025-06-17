import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqi_chemists_syndicate_law/core/di/di.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/data/repo/repo.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/membership_registeration_screen.dart';
import 'package:iraqi_chemists_syndicate_law/module/renew_member/cubit/renew_member_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/module/renew_member/data/repo/repo.dart';
import 'package:iraqi_chemists_syndicate_law/module/renew_member/renew_member.dart';
import 'package:iraqi_chemists_syndicate_law/module/surname_changed/cubit/surname_changed_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/module/surname_changed/data/repo/repo.dart';
import 'package:iraqi_chemists_syndicate_law/module/surname_changed/surname_changed.dart';
import 'package:iraqi_chemists_syndicate_law/module/test.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
   

      case MembershipRegisterationScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => MembershipRegisterationCubit( getIt<MembershipRegisterationRepo>(),),
            child: const MembershipRegisterationScreen(),
          ),
        );
        

      case SurnameChanged.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SurnameChangedCubit(getIt<SurnameRepo>(),),
            child: const SurnameChanged(),
          ),
        );
        case RenewMember.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RenewMemberCubit(getIt<RenewMemberRepo>(),),
            child: const RenewMember(),
          ),
        );
        case Test.routeName:
        return MaterialPageRoute(
          builder: (_) => const Test(),
        );

      default:
        return null;
    }
  }
}

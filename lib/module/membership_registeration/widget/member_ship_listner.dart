import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_alert_dialog_message.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_state.dart';

class MemberShipListner extends StatelessWidget {
  const MemberShipListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<
      MembershipRegisterationCubit,
      MembershipRegisterationState
    >(
      listener: (context, state) {
        switch (state) {
          case MembershipRegisterationSuccess _:
            MembershipRegisterationCubit.get(context).nextPage();

            break;
          case MembershipRegisterationError _:
            showCustomAlertDialog(
              context: context,
              message: state.message,
              title: "Error",
            );

            break;
          default:
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}

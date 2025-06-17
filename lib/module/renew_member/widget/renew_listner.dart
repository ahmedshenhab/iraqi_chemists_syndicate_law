import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_alert_dialog_message.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/reusable.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/module/renew_member/cubit/renew_member_cubit.dart';

class RenewListner extends StatelessWidget {
  const RenewListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RenewMemberCubit, RenewMemberState>(
      listener: (context, state) {
        switch (state) {
          case RenewMemberSuccess _:
            buildshowToast(msg: state.message, color: AppColor.green);

            break;
          case RenewMemberError _:
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

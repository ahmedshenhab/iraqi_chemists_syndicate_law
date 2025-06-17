import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_alert_dialog_message.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/reusable.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/module/surname_changed/cubit/surname_changed_cubit.dart';

class SurnameListner extends StatelessWidget {
  const SurnameListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SurnameChangedCubit, SurnameChangedState>(
      listener: (context, state) {
        switch (state) {
          case SurnameChangedSuccess _:
            buildshowToast(msg: state.message, color: AppColor.green);

            break;
          case SurnameChangedError _:
            showCustomAlertDialog(
              context: context,
              message: state.error,
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

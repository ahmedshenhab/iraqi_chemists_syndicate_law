import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/membership_registeration/cubit/membership_registeration_cubit_cubit.dart';

class PledgeAndRegistration extends StatelessWidget {
  const PledgeAndRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MembershipRegisterationCubit.get(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.h),
        child: Column(
          children: [
            SizedBox(height: 15.h),

            SvgPicture.asset(
              'assets/image/svg/pledge.svg',
              width: MediaQuery.of(context).size.width * 0.65,
            ),
            SizedBox(height: 15.h),

            SvgPicture.asset('assets/image/svg/pledge_seconde.svg'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('هل أنت موظف؟', style: AppTextStyle.medium20),
                Radio.adaptive(
                  value: true,
                  groupValue: cubit.groupValue,
                  onChanged: (value) {
                    cubit.groupValue = value;
                  },
                ),
                const Text('نعم'),

                Radio.adaptive(
                  value: false,
                  groupValue: cubit.groupValue,
                  onChanged: (value) {
                    cubit.groupValue = value;
                  },
                ),
                const Text('لا'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

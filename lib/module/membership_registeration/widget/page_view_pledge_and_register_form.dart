import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_check_box.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_radio.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit.dart';

class PageViewPledgeAndRegisterForm extends StatelessWidget {
  const PageViewPledgeAndRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MembershipRegisterationCubit.get(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('assets/image/svg/pledge.svg', height: 24.h),
        SizedBox(height: 60.h),
        SvgPicture.asset('assets/image/svg/pledge_second.svg', height: 194.h),
        SizedBox(height: 40.h),

        /// Employee question
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text('هل أنت موظف؟', style: AppTextStyle.medium20)),
            Flexible(
              child: Row(
                children: [
                  CustomRadio<bool>(
                    value: true,
                    groupValue: cubit.isEmployee ?? false,
                    onChanged: (value) {
                      cubit.isEmployee = value;
                    },
                    label: 'نعم',
                    activeColor: AppColor.aquaGreen,
                  ),
                  SizedBox(width: 16.w),
                  CustomRadio<bool>(
                    value: false,
                    groupValue: cubit.isEmployee ?? false,
                    onChanged: (value) {
                      cubit.isEmployee = value;
                    },
                    label: 'لا',
                    activeColor: AppColor.aquaGreen,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 50.h),

        /// First checkbox
        CustomCheckBox(
          value: true,
          onChanged: (p0) {},
          widget: Flexible(
            child: Wrap(
              children: [
                Text('اوافق على جميع ', style: AppTextStyle.medium16),
                Text(
                  'الشروط ',
                  style: AppTextStyle.medium16.copyWith(
                    color: AppColor.redOrange,
                  ),
                ),
                Text('وسياسات ', style: AppTextStyle.medium16),
                Text(
                  'الخصوصية',
                  style: AppTextStyle.medium16.copyWith(
                    color: AppColor.redOrange,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 6.h),

        /// Second checkbox
        CustomCheckBox(
          value: true,
          onChanged: (p0) {},
          widget: Flexible(
            child: Text(
              'اتعهد بصحة جميع المعلومات التي وردت في التسجيل و بخلافه اتحمل كافة التبعات القانونية',
              style: AppTextStyle.medium16,
            ),
          ),
        ),
      ],
    );
  }
}

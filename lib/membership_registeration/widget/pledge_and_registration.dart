import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_elevated_button.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
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

            SvgPicture.asset(
              'assets/image/svg/pledge_seconde.svg',

              height: MediaQuery.of(context).size.height * 0.3,
            ),
            SizedBox(height: 15.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text('هل أنت موظف؟', style: AppTextStyle.medium20),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    spacing: 10.w,
                    children: [
                      Radio.adaptive(
                        value: true,
                        groupValue: cubit.groupValue,
                        onChanged: (value) {
                          cubit.groupValue = value;
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.08,
                        child: const Text(
                          'نعم',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

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
                ),
              ],
            ),

            CustomcheckBox(
              widget: Flexible(
                child: Wrap(
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      'اوافق على جميع ',
                      style: AppTextStyle.medium16,
                    ),
                    Text(
                      textAlign: TextAlign.start,
                      'الشروط ',
                      style: AppTextStyle.medium16.copyWith(
                        color: AppColor.redOrange,
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.start,
                      'وسياسات ',
                      style: AppTextStyle.medium16,
                    ),
                    Text(
                      textAlign: TextAlign.start,
                      'الخصوصية',
                      style: AppTextStyle.medium16.copyWith(
                        color: AppColor.redOrange,
                      ),
                    ),
                  ],
                ),
              ),
              onChanged: (p0) {},
              value: true,
            ),
            SizedBox(height: 15.h),
            CustomcheckBox(
              widget: Flexible(
                child: Text(
                  textAlign: TextAlign.start,
                  'اتعهد بصحة جميع المعلومات التي وردت في التسجيل و بخلافه اتحمل كافة التبعات القانونية',
                  style: AppTextStyle.medium16,
                ),
              ),
              onChanged: (p0) {},
              value: true,
            ),

            SizedBox(height: 30.h),
            CustomElevatedButton(text: 'تسجيل طلب انتساب', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class CustomcheckBox extends StatelessWidget {
  const CustomcheckBox({
    super.key,
    required this.widget,
    required this.onChanged,
    required this.value,
  });
  final Widget widget;
  final void Function(bool?)? onChanged;
  final bool? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox.adaptive(value: value, onChanged: onChanged),
        widget,
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_elevated_button.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit.dart';

class PledgeAndRegistration extends StatefulWidget {
  const PledgeAndRegistration({super.key});

  @override
  State<PledgeAndRegistration> createState() => _PledgeAndRegistrationState();
}

class _PledgeAndRegistrationState extends State<PledgeAndRegistration> {
  @override
  Widget build(BuildContext context) {
    final cubit = MembershipRegisterationCubit.get(context);

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 24.h),
            child: Column(
              children: [
                SizedBox(height: 12.h),
                Image.asset(
                  'assets/image/png/logo.png',
                  width: 80.w,
                  height: 102.h,
                ),
                SizedBox(height: 24.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: SvgPicture.asset(
                    'assets/image/svg/pledge.svg',
                    height: 24.h,
                  ),
                ),
                SizedBox(height: 60.h),
                SvgPicture.asset(
                  'assets/image/svg/pledge_second.svg',
                  height: 194.h,
                ),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text('هل أنت موظف؟', style: AppTextStyle.medium20),
                    ),
                    Flexible(
                      flex: 2,
                      child: Row(
                        children: [
                          Radio.adaptive(
                            activeColor: AppColor.aquaGreen,
                            value: true,
                            groupValue: cubit.groupValue,
                            onChanged: (value) {
                              cubit.groupValue = value;
                              setState(() {});
                            },
                          ),
                          const Text('نعم'),
                          SizedBox(width: 16.w),
                          Radio.adaptive(
                            activeColor: AppColor.aquaGreen,
                            value: false,
                            groupValue: cubit.groupValue,
                            onChanged: (value) {
                              cubit.groupValue = value;
                              setState(() {});
                            },
                          ),
                          const Text('لا'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
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
                // SizedBox(height: 16.h),
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
            ),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: CustomElevatedButton(
            text: 'تسجيل طلب انتساب',
            onPressed: () {
              // Add submit logic here
            },
            fixedHeight: 40.h,
          ),
        ),
      ],
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(value: value, onChanged: onChanged),
        widget,
      ],
    );
  }
}

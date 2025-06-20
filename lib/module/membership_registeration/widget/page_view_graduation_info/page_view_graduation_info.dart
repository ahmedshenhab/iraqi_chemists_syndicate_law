import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_elevated_icon_button.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/page_view_graduation_info/widget/graduation_info_form.dart';

class PageViewGraduationInfo extends StatefulWidget {
  const PageViewGraduationInfo({super.key});

  @override
  State<PageViewGraduationInfo> createState() => _PageViewGraduationInfoState();
}

class _PageViewGraduationInfoState extends State<PageViewGraduationInfo> {
  File? file;

  @override
  Widget build(BuildContext context) {
    final cubit = MembershipRegisterationCubit.get(context);

    return Column(
      children: [
        const GraduationInfoForm(),

        Padding(
          padding: EdgeInsetsDirectional.only(bottom: 10.h, top: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: CustomElevatedIconButton(
                  onPressed: ()  {
                    cubit.previousPage();
                   
                  },
                  backgroundColor: AppColor.white,
                  side: const BorderSide(color: AppColor.primary),
                  icon: SvgPicture.asset(
                    'assets/image/svg/skip_previous.svg',
                    width: 22.w,
                  ),
                  label: Text(
                    'السابق',
                    style: AppTextStyle.bold14.copyWith(
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 30.w),

              Expanded(
                child: CustomElevatedIconButton(
                  onPressed: () async {
                    // Show validation messages if not valid
                    if (cubit.formKeyGraduation.currentState!.validate()) {
                      await cubit.nextPage();
                    }
                  },
                  icon: SvgPicture.asset(
                    'assets/image/svg/skip_next.svg',
                    width: 22.w,
                  ),
                  label: Text(
                    'التالي',
                    style: AppTextStyle.bold14.copyWith(color: AppColor.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

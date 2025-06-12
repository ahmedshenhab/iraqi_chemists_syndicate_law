import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_elevated_icon_button.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/reusable.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/renew_member/cubit/renew_member_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/module/renew_member/widget/renew_member_forms.dart';
import 'package:iraqi_chemists_syndicate_law/module/renew_member/widget/renew_member_images.dart';

class RenewMember extends StatelessWidget {
  const RenewMember({super.key});
  static const routeName = '/renew_member';

  @override
  Widget build(BuildContext context) {
    final cubit = RenewMemberCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 24.h),
                child: Column(
                  children: [
                    const RenewMemberForms(),

                    SizedBox(height: 16.h),
                    const RenewMemberImages(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 10.h,
                top: 12.h,
                start: 16.w,
                end: 16.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedIconButton(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                    side: const BorderSide(color: AppColor.primary),
                    backgroundColor: AppColor.white,
                    onPressed: () {},

                    icon: SvgPicture.asset(
                      'assets/image/svg/skip_previous.svg',
                      width: 18.w,
                    ),
                    label: Text(
                      'الرجوع',
                      style: AppTextStyle.bold14.copyWith(
                        color: AppColor.primary,
                      ),
                    ),
                    width: 164.w,
                    height: 40.h,
                  ),

                  CustomElevatedIconButton(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        if (cubit.magesteerimage != null) {
                          log('');
                        } else {
                          buildshowToast(
                            msg: 'يجب اختيار صورة شهاده الماجستير',
                            color: AppColor.red,
                          );
                        }
                      }
                    },

                    icon: SvgPicture.asset(
                      'assets/image/svg/money.svg',
                      width: 18.w,
                    ),
                    label: Text(
                      'دفع رسوم التجديد',
                      style: AppTextStyle.bold14.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                    width: 164.w,
                    height: 40.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_drop_down_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_elevated_icon_button.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_text_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/custom_image_and_discription.dart';
import 'package:iraqi_chemists_syndicate_law/module/surname_changed/cubit/surname_changed_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/module/surname_changed/widget/surname_changes_forms.dart';
import 'package:iraqi_chemists_syndicate_law/module/surname_changed/widget/surname_changes_images.dart';

class SurnameChanged extends StatelessWidget {
  const SurnameChanged({super.key});
  static const routeName = '/surnameChanged';

  @override
  Widget build(BuildContext context) {
    final cubit = SurnameChangedCubit.get(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SurnameChangesForms(),

                    SizedBox(height: 16.h),
                    const SurnameChangesImages(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(bottom: 10.h, top: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedIconButton(
                    side: const BorderSide(color: AppColor.primary),
                    backgroundColor: AppColor.white,
                    onPressed: () {},

                    icon: SvgPicture.asset(
                      'assets/image/svg/skip_previous.svg',
                      width: 22.w,
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
                    onPressed: () {},

                    icon: SvgPicture.asset(
                      'assets/image/svg/skip_next.svg',
                      width: 22.w,
                    ),
                    label: Text(
                      'التالي',
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

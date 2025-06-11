import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_drop_down_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_elevated_button.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_elevated_icon_button.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/custom_image_and_discription.dart';

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
                    'assets/image/svg/graduation_info.svg',
                    height: 24.h,
                  ),
                ),

                SizedBox(height: 32.h),
                CustomDropDownFormField(
                  hintText: 'الشهادة',
                  items: ['بكالوريوس', 'ماجستير', 'دكتوراه']
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e, style: AppTextStyle.regular14),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {},
                  icon: const Icon(Icons.arrow_drop_down, color: AppColor.grey),
                ),
                SizedBox(height: 32.h),
                CustomDropDownFormField(
                  hintText: 'الجامعة',
                  items: ['جامعة بغداد', 'جامعة الموصل']
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e, style: AppTextStyle.regular14),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {},
                  icon: const Icon(Icons.arrow_drop_down, color: AppColor.grey),
                ),
                SizedBox(height: 32.h),
                CustomDropDownFormField(
                  hintText: 'الكلية',
                  items: ['كلية الصيدلة', 'كلية العلوم']
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e, style: AppTextStyle.regular14),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {},
                  icon: const Icon(Icons.arrow_drop_down, color: AppColor.grey),
                ),

                SizedBox(height: 32.h),
                CustomDropDownFormField(
                  hintText: 'سنة التخرج',
                  items: List.generate(30, (index) => (2000 + index).toString())
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e, style: AppTextStyle.regular14),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {},
                  icon: const Icon(Icons.arrow_drop_down, color: AppColor.grey),
                ),
                SizedBox(height: 32.h),
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
                  'السابق',
                  style: AppTextStyle.bold14.copyWith(color: AppColor.primary),
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
                  style: AppTextStyle.bold14.copyWith(color: AppColor.white),
                ),
                width: 164.w,
                height: 40.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reg_ex.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_text_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit.dart';

class FormBasicInformation extends StatelessWidget {
  const FormBasicInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MembershipRegisterationCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('assets/image/svg/basic info.svg', height: 24.h),
        SizedBox(height: 32.h),
        CustomTextFormField(
          type: TextInputType.name,
          controller: cubit.arabicFullNameController,
          validator: (value) {
            if (value!.isEmpty || !RegEx.regArabicName.hasMatch(value)) {
              return 'الاسم الثلاثي باللغه العربية مطلوب';
            }

            return null;
          },
          labelText: 'الاسم الثلاثي باللغه العربية',
        ),

        SizedBox(height: 32.h),
        CustomTextFormField(
          type: TextInputType.name,
          controller: cubit.englishFullNameController,
          validator: (value) {
            if (value!.isEmpty || !RegEx.regEnglishName.hasMatch(value)) {
              return 'الاسم الثلاثي باللغه الانجليزية مطلوب';
            }
            return null;
          },
          labelText: 'الاسم الثلاثي باللغه الانجليزية',
        ),
        SizedBox(height: 32.h),
        CustomTextFormField(
          type: TextInputType.emailAddress,
          labelText: 'الايميل',
          controller: cubit.emailController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'الايميل مطلوب';
            } else if (!RegEx.regEmail.hasMatch(value)) {
              return 'الايميل غير صحيح';
            }
            return null;
          },
          suffixIconButton: Icon(Icons.mail, color: AppColor.grey, size: 15.h),
        ),
        SizedBox(height: 32.h),
        CustomTextFormField(
          type: TextInputType.phone,
          labelText: 'رقم الهاتف',
          controller: cubit.phoneController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'رقم الهاتف مطلوب';
            } else if (!RegEx.regPhone.hasMatch(value)) {
              return 'رقم الهاتف غير صحيح';
            }
            return null;
          },
          suffixIconButton: Icon(
            Icons.phone_outlined,
            color: AppColor.grey,
            size: 15.h,
          ),
        ),
      ],
    );
  }
}

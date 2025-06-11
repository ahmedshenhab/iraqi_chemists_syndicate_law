import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
          validator: (p0) {},
          labelText: 'الاسم الثلاثي باللغه العربية',
        ),

        SizedBox(height: 32.h),
        CustomTextFormField(
          type: TextInputType.name,
          controller: cubit.englishFullNameController,
          validator: (p0) {},
          labelText: 'الاسم الثلاثي باللغه الانجليزية',
        ),
        SizedBox(height: 32.h),
        CustomTextFormField(
          type: TextInputType.emailAddress,
          labelText: 'الايميل',
          controller: cubit.emailController,
          validator: (p0) {},
          suffixIconButton: Icon(Icons.mail, color: AppColor.grey, size: 15.h),
        ),
        SizedBox(height: 32.h),
        CustomTextFormField(
          type: TextInputType.phone,
          labelText: 'رقم الهاتف',
          controller: cubit.phoneController,
          validator: (p0) {},
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
